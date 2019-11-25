Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  config.vm.box_version = "1905.1"
  config.vm.provision "shell", inline: <<-SHELL

  # Setup mail agent
  dnf install postfix -y
  systemctl enable postfix
  systemctl start postfix
  dnf install mailx -y

  cp /vagrant/logwatch.sh /etc/cron.hourly/
  chmod +x /etc/cron.hourly/logwatch.sh

  SHELL
end