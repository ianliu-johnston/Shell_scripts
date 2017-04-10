#!/usr/bin/env bash
# https://www.digitalocean.com/community/tutorials/how-to-use-port-knocking-to-hide-your-ssh-daemon-from-attackers-on-ubuntu
sudo ufw enable
sudo ufw default deny incoming
sudo cp sshd_conf /etc/ssh/sshd_conf
sudo service ssh restart

sudo apt-get update
sudo apt-get install -y knockd
sudo cp knockd.conf /etc/knockd.conf
sed -i "s/START_KNOCKD=0/START_KNOCKD=1/g" /etc/default/knockd
sudo service knockd start
