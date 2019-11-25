#!/bin/bash

lockfile=/tmp/logwatch
logfile=/vagrant/access*
timefile=./timefile
firstlinefile=./firstlinefile


# Handle Start/End date of running script
get_start_end_date(){
    end_date=$(date)

    if [[ -f "$timefile" ]]; then
        start_date=$(cat "$timefile")
    else
        start_date=$(date -d"1970-01-01 00:00:00 UTC")
        echo $start_date > $timefile
    fi
    # Save End date to a file
    echo $end_date > $timefile
}


get_first_line(){
    if [[ -f "$firstlinefile" ]]; then
        first_line=$(cat "$firstlinefile")
    else
        first_line='1'
    fi
    
    wc -l $(echo "$logfile") | awk '{ print $1 }' > $firstlinefile
}


if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null;
then
    trap 'rm -f "$lockfile"; exit $?' INT TERM EXIT

    get_start_end_date;

    for file in $logfile; do
        echo "Processing file: $file ..."
        echo "Timerange: $start_date - $end_date"

        get_first_line;
        echo "First line: $first_line"

        printf "\n\n"

        echo "Top requested IP's:"
        echo "----------------"
        tail -n +"$first_line" "$file" | awk '{print $1}' | sort | uniq -c | sort -rn | head -n 10
        printf "\n\n"

        echo "Top requested pages:"
        echo "----------------"
        tail -n +"$first_line" "$file" | awk '{print $7}' | sort | uniq -c | sort -rn | head -n 10
        printf "\n\n"


        echo "Top return codes:"
        echo "----------------"
        tail -n +"$first_line" "$file" | awk '{print $9}' | sort | uniq -c | sort -rn | head -n 10
        printf "\n\n"

        echo "Top error (4xx, 5xx) codes:"
        echo "----------------"
        tail -n +"$first_line" "$file" | awk '{print $9}' | egrep "[45].."  | sort | uniq -c | sort -rn | head -n 10
        printf "\n\n"
    done

    rm -f "$lockfile"
    trap - INT TERM EXIT
else
    echo "Failed to acquire lockfile: $lockfile."
    echo "Held by $(cat $lockfile)"
fi
