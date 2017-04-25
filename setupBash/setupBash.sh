#!/bin/bash
DEFAULT_EMAIL="ian.liu-johnson@holbertonschool.com"
DEFAULT_NAME="ianliu-johnston"
MYSQL_APT=mysql-apt-config_0.8.3-1_all.deb
echo "###############################################################"
echo "Default setup for Ian Liu-Johnston's development environment for Holberton School."
echo "In setup.sh, change DEFAULT_EMAIL to your email address, and DEFAULT_NAME to your name."
echo "Setup includes configuration for mysql, python, nodejs, misc binary packages and repositories for a development environment."
echo "Also configures bash functions, precommit hooks, etc."
echo "################################"
echo "Setting up Bash, vim and emacs customizations"
echo "################################"
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
echo "################################"
echo "Configuring Git"
echo "################################"
git config --global user.email $DEFAULT_EMAIL
git config --global user.name $DEFAULT_NAME
if [ ! -a ~/.ssh ]; then
	mkdir ~/.ssh
fi
cat config >> ~/.ssh/config
echo "################################"
echo "Installing packages"
echo "################################"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install emacs radare2 valgrind p7zip-full tshark shellcheck python3-pip gdb docker docker.io shellcheck
echo "################################"
echo "Setting up Nodejs"
echo "################################"
sudo apt-get install -y nodejs
sudo apt-get install -y npm
echo "################################"
echo "Setting up Mysql, default password is 'faker'"
echo "Default MySQL installation is" $MYSQL_APT
echo "################################"
wget https://dev.mysql.com/get/$MYSQL_APT
sudo dpkg -i $MYSQL_APT
echo mysql-server mysql-server/root_password select faker | debconf-set-selections
echo mysql-server mysql-server/root_password_again select faker | debconf-set-selections
sudo apt-get update
sudo apt-get install -y mysql-server
rm $MYSQL_APT
sudo apt-get -y install python3-dev libmysqlclient-dev
echo "################################"
echo "Setting up MySQL-Python ORM"
echo "################################"
sudo -H pip3 install mysqlclient
sudo -H pip3 install sqlalchemy
echo "################################"
echo "Installing Flask"
echo "################################"
sudo -H pip3 install Flask
echo "################################"
echo "Setting up Misc python packages"
echo "################################"
sudo -H pip3 install pep8
echo "################################"
echo "Git Cloning Style Checking programs"
echo "################################"
git clone https://github.com/holbertonschool/Betty.git ~/Betty
git clone https://github.com/holbertonschool/W3C-Validator.git ~/W3C-Validator
git clone https://github.com/$DEFAULT_NAME/holbertonschool-low_level_programming.git ~/holbertonschool-low_level_programming
pushd ~/holbertonschool-low_level_programming/.git/hooks/
git remote set-url origin git@github.com:$DEFAULT_NAME/holbertonschool-low_level_programming.git
ln -s ~/pre-commit .
git submodule foreach git pull origin master
git submodule update --init --recursive
popd
git clone https://github.com/$DEFAULT_NAME/holbertonschool-higher_level_programming.git ~/holbertonschool-higher_level_programming
pushd ~/holbertonschool-higher_level_programming/.git/hooks/
git remote set-url origin git@github.com:$DEFAULT_NAME/holbertonschool-higher_level_programming.git
ln -s ~/pre-commit .
git submodule foreach git pull origin master
git submodule update --init --recursive
popd
git clone https://github.com/$DEFAULT_NAME/holbertonschool-sysadmin_devops.git ~/holbertonschool-sysadmin_devops
pushd ~/holbertonschool-sysadmin_devops/.git/hooks/
git remote set-url origin git@github.com:$DEFAULT_NAME/holbertonschool-sysadmin_devops.git
ln -s ~/pre-commit .
git submodule foreach git pull origin master
git submodule update --init --recursive
popd
git clone https://github.com/$DEFAULT_NAME/AirBnb_clone_v3 ~/AirBnb_clone_v3
pushd ~/AirBnb_clone_v3/.git/hooks/
git remote set-url origin git@github.com:$DEFAULT_NAME/AirBnb_clone_v3.git
ln -s ~/pre-commit .
git submodule foreach git pull origin master
git submodule update --init --recursive
popd
. eval $(ssh-agent -s)
. ssh-add ~/.ssh/git
