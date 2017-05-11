#!/bin/bash
if [[ $# -eq 2 ]]; then
	echo "Using custom name and emails for configuring git"
	DEFAULT_EMAIL="$1"
	DEFAULT_NAME="$2"
else
	echo "Using default name and emails for configuring git"
	DEFAULT_EMAIL="ian.liu-johnson@holbertonschool.com"
	DEFAULT_NAME="ianliu-johnston"
fi
MYSQL_APT=mysql-apt-config_0.8.3-1_all.deb
GIT_REPOS=("holbertonschool-low_level_programming" "holbertonschool-higher_level_programming" "holbertonschool-sysadmin_devops" "AirBnB_clone_v4")
echo "###############################################################"
echo "Default setup for Ian Liu-Johnston's development environment for Holberton School."
echo "In setup.sh, change DEFAULT_EMAIL to your email address, and DEFAULT_NAME to your name."
echo "Setup includes configuration for mysql, python, nodejs, misc binary packages and repositories for a development environment."
echo "Also configures bash functions, precommit hooks, etc."
echo "################################"
echo "Setting up Bash, vim and emacs customizations"
echo "################################"
cp bash_aliases ~/.bash_aliases
cp emacs ~/.emacs
cp vimrc ~/.vimrc
cp pre-commit ~
cp update.sh ~
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
if [ -z ~/.ssh ]; then
	mkdir ~/.ssh
fi
cat config >> ~/.ssh/config
echo "################################"
echo "Installing packages"
echo "################################"
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install emacs radare2 valgrind p7zip-full tshark shellcheck python3-pip gdb docker docker.io shellcheck
echo "################################"
echo "Setting up Nodejs"
echo "################################"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install semistandard --global
echo "################################"
echo "Setting up Mysql, default password is 'faker'"
echo "Default MySQL installation is" $MYSQL_APT
echo "################################"
wget https://dev.mysql.com/get/$MYSQL_APT
sudo dpkg -i $MYSQL_APT
echo mysql-server mysql-server/root_password select faker | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again select faker | sudo debconf-set-selections
sudo apt-get update
sudo apt-get install -y mysql-server
rm $MYSQL_APT
sudo apt-get -y install python3-dev libmysqlclient-dev
echo "################################"
echo "Setting up Python packages: mysqlclient sqlalchemy Flask and pep8"
echo "################################"
sudo -H pip3 install mysqlclient sqlalchemy Flask pep8
echo "################################"
echo "Git Cloning Style Checking programs"
echo "################################"
git clone https://github.com/holbertonschool/Betty.git ~/Betty
git clone https://github.com/holbertonschool/W3C-Validator.git ~/W3C-Validator

for REPO in ${GIT_REPOS[@]}; do
    echo "################################"
    echo "Cloning $REPO"
    echo "################################"
    git clone https://github.com/$DEFAULT_NAME/$REPO.git ~/$REPO
    pushd ~/$REPO/.git/hooks/
    git remote set-url origin git@github.com:$DEFAULT_NAME/$REPO.git
    ln -s ~/pre-commit .
    popd
	pushd ~/$REPO
	git submodule update --init --recursive
	popd
done
echo "################################"
echo "Setting up ssh agent"
echo "################################"
. eval $(ssh-agent -s)
. ssh-add ~/.ssh/git
