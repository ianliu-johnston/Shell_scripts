#!/bin/bash

MYSQL_APT=mysql-apt-config_0.8.3-1_all.deb
wget https://dev.mysql.com/get/$MYSQL_APT
export DEBIAN_FRONTEND="noninteractive"
sudo dpkg -i $MYSQL_APT
echo mysql-server mysql-server/root_password select faker | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again select faker | sudo debconf-set-selections
sudo apt-get update
sudo apt-get install -y mysql-server
rm $MYSQL_APT
