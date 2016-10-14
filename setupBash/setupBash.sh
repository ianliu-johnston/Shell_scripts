#!/bin/bash
sudo apt-get -y install git emacs
git clone https://github.com/ianliu-johnston/BatchScripts.git
git clone https://github.com/holbertonschool/Betty.git
cp ~/BatchScripts/initialSetup/bash_aliases ~/.bash_aliases
cp emacsrc ~/.emacsrc
cp vimrc ~/.vimrc
git config --global user.email "ian.liu-johnson@holbertonschool.com"
git config --global user.name "Ian Liu-Johnston"
