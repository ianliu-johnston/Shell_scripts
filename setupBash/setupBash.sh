#!/bin/bash
sudo apt-get -y install emacs
git clone https://github.com/holbertonschool/Betty.git
mv Betty ~/
cp bash_aliases ~/.bash_aliases
cp emacsrc ~/.emacsrc
cp vimrc ~/.vimrc
mkdir ~/TEST
echo 'export T=~/TEST' >> ~/.profile
git config --global user.email "ian.liu-johnson@holbertonschool.com"
git config --global user.name "Ian Liu-Johnston"
sed -i 's/\#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc
