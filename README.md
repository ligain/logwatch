# Bash  practice
This script run hourly and analyze log file `access-4560-644067.log` and sends statistics to system administrator (root)
How statistics look like:
```
Processing file: ./access-4560-644067.log ...
Timerange: Thu Jan  1 03:00:00 MSK 1970 - Tue Nov 26 01:05:29 EET 2019
First line: 1


Top requested IP's:
----------------
     45 93.158.167.130
     39 109.236.252.130
     37 212.57.117.19
     33 188.43.241.106
     31 87.250.233.68
     24 62.75.198.172
     22 148.251.223.21
     20 185.6.8.9
     17 217.118.66.161
     16 95.165.18.146


Top requested pages:
----------------
    157 /
    120 /wp-login.php
     57 /xmlrpc.php
     26 /robots.txt
     12 /favicon.ico
     11 400
      9 /wp-includes/js/wp-embed.min.js?ver=5.0.4
      7 /wp-admin/admin-post.php?page=301bulkoptions
      7 /1
      6 /wp-content/uploads/2016/10/robo5.jpg


Top return codes:
----------------
    498 200
     95 301
     51 404
     11 "-"
      7 400
      3 500
      2 499
      1 405
      1 403
      1 304


Top error (4xx, 5xx) codes:
----------------
     51 404
      7 400
      3 500
      2 499
      1 405
      1 403

```
# Project installation  

0) `vagrant`  should be installed on your system
```
$ vagrant -v
Vagrant 2.2.5
```
1) Clone this repository
```bash  
$ git clone https://github.com/ligain/logwatch.git  
``` 
2) Go to project folder
```bash  
$ cd logwatch/
```  
2) Run vagrant
```bash  
$ vagrant up
```  

# Project Goals 
The code is written for educational purposes.