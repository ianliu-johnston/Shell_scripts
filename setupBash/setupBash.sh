#!/bin/bash
sudo apt-get update
sudo apt-get -y install emacs radare2 valgrind p7zip-full tshark shellcheck python3-pip gdb docker docker.io shellcheck
############ Setup Node ####################
echo "setting up Nodejs"
sudo apt-get install -y nodejs
sudo apt-get install -y npm
## Setup for MYSQL and python integration ##
echo "Setting up Mysql"
MYSQL_APT=mysql-apt-config_0.8.3-1_all.deb
wget https://dev.mysql.com/get/$MYSQL_APT
sudo dpkg -i $MYSQL_APT
sudo apt-get update
sudo apt-get install mysql-server
sudo apt-get -y install python3-dev libmysqlclient-dev
sudo -H pip3 install mysqlclient
sudo -H pip3 install sqlalchemy
############ Setup Flask ####################
sudo -H pip3 install Flask
##### Setup for misc python packages ######
echo "Setting up Misc python packages"
sudo -H pip3 install pep8

git clone https://github.com/holbertonschool/Betty.git ~/Betty
git clone https://github.com/holbertonschool/W3C-Validator.git ~/W3C-Validator
cp bash_aliases ~/.bash_aliases
cp emacsrc ~/.emacsrc
cp vimrc ~/.vimrc
cp pre-commit ~
cp -r vim ~/.vim
sed -i 's/\#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc
echo 'export PS1="\[\e]0; \u: \W\a\]\[\033[01;40m\]\A \u:\[\033[00m\]\[\033[01;44m\]\W\[\033[00m\]~> "' >> ~/.bashrc
echo 'export TZ="/usr/share/zoneinfo/America/Los_Angeles"' >> ~/.bashrc
echo -e "betty() {\n    /home/$(whoami)/Betty/betty-doc.pl \$1\n     /home/$(whoami)/Betty/betty-style.pl \$1\n}\n" >> ~/.bashrc
echo -e "htmlstyle(){\n    /home/$(whoami)/W3C-Validator/w3c_validator.py \$1\n}\n" >> ~/.bashrc
#setup Git
git config --global user.email "ian.liu-johnson@holbertonschool.com"
git config --global user.name "Ian Liu-Johnston"
if [ ! -a ~/.ssh ]; then
	mkdir ~/.ssh
fi
cat config >> ~/.ssh/config
git clone https://github.com/ianliu-johnston/holbertonschool-low_level_programming.git ~/holbertonschool-low_level_programming
pushd ~/holbertonschool-low_level_programming/.git/hooks/
git remote set-url origin git@github.com:ianliu-johnston/holbertonschool-low_level_programming.git
ln -s ~/pre-commit .
git submodule foreach git pull origin master
git submodule update --init --recursive
popd
git clone https://github.com/ianliu-johnston/holbertonschool-higher_level_programming.git ~/holbertonschool-higher_level_programming
pushd ~/holbertonschool-higher_level_programming/.git/hooks/
git remote set-url origin git@github.com:ianliu-johnston/holbertonschool-higher_level_programming.git
ln -s ~/pre-commit .
git submodule foreach git pull origin master
git submodule update --init --recursive
popd
git clone https://github.com/ianliu-johnston/holbertonschool-sysadmin_devops.git ~/holbertonschool-sysadmin_devops
pushd ~/holbertonschool-sysadmin_devops/.git/hooks/
git remote set-url origin git@github.com:ianliu-johnston/holbertonschool-sysadmin_devops.git
ln -s ~/pre-commit .
git submodule foreach git pull origin master
git submodule update --init --recursive
popd
. eval $(ssh-agent -s)
. ssh-add ~/.ssh/git
