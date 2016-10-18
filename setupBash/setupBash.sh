#!/bin/bash
sudo apt-get -y install emacs
git clone https://github.com/holbertonschool/Betty.git
mv Betty ~/
cp bash_aliases ~/.bash_aliases
cp emacsrc ~/.emacsrc
cp vimrc ~/.vimrc
mkdir ~/TEST
echo 'export T=~/TEST' >> ~/.profile
sed -i 's/\#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc
echo 'export PS1="\A~ \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$"' >> ~/.bashrc
git config --global user.email "ian.liu-johnson@holbertonschool.com"
git config --global user.name "Ian Liu-Johnston"
