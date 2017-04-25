#!/bin/bash
echo "This script is for customization on Lubuntu v.16.04"
# Install all tools I need.
if [[ $# -ne 2 ]]; then
	echo "USAGE: ./setup_laptop.sh <email> <github username>"
sudo apt-get update
echo "installing utils"
sudo apt-get install -y pavucontrol audacity ffmpeg vlc thunderbird chromium-browser tmux
echo "Installing dev tools"
sudo apt-get install -y git p7zip-full emacs exfat-fuse exfat-utils tmux virtualbox vagrant
sudo apt-get install -y gdb radare2 valgrind gcc-4.8 gcc docker docker.io tshark shellcheck
git clone https://github.com/holbertonschool/Betty.git ~/Betty
if [[ "$1" == "h4xx0r"]]; then
	echo "1337 mode"
	sudo apt-get install -y hydra aircrack-ng nmap privoxy tor whois john
	git clone https://github.com/danielmiessler/SecLists ~/SecLists
	wget http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
#	wget https://www.torproject.org/dist/torbrowser/6.5.1/tor-browser-linux64-6.5.1_en-US.tar.xz
#	tar -xvJf tor-browser-linux64-6.5.1_en-US.tar.xz
#	rm tor-browser-linux64-6.5.1_en-US.tar.xz
fi
# Install Python Modules I need
sudo apt-get install -y python3-pip
### Fabric
sudo pip3 uninstall Fabric
sudo apt-get install -y libffi-dev libssl-dev python3.4-dev libpython3-dev
sudo pip3 install pyparsing appdirs Fabric3
### Pep8
sudo pip3 install pep8
# Uninstall any I don't need
echo "removing unnecessary apps + dirs"
sudo apt-get purge -y pidgin pidgin-data gnumeric mplayer gnome-mplayer
sudo apt-get purge -y audacious audacious-plugins audacious-plugins-data
sudo apt-get purge -y sylpheed sylpheed-doc sylpheed-i18n sylpheed-plugins
sudo apt autoremove
rm -v ~/Pictures ~/Templates ~/Videos
echo "Setting up Bash customizations"
cp bash_aliases ~/.bash_aliases
cp Xmodmap ~/.bash_aliases
cp emacsrc ~/.emacsrc
cp tmux.conf ~/.tmux.conf
cp vimrc ~/.vimrc
cp -r vim ~/.vim
sed -i 's/\#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc
echo 'export PS1="\A~ \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$"' >> ~/.bashrc
echo 'export TZ="/usr/share/zoneinfo/America/Los_Angeles"' >> ~/.bashrc
echo -e "betty() {\n    /home/`whoami`/Betty/betty-doc.pl $1\n     /home/`whoami`/Betty/betty-style.pl $1\n}\n" >> ~/.bashrc
# Setup Git
git config --global user.email "$EMAIL"
git config --global user.name "$GITHUB_NAME"
if [ ! -a ~/.ssh ]; then
		mkdir ~/.ssh
fi
cat config >> ~/.ssh/config
# Start firewall.
echo "Starting protections"
ufw enable
# Setup Slack
echo "Download slack, ubuntu 64 bit .deb file, install with dpkg -i file.deb"
echo "Sometimes there is a small dependency error. Delete the dependency. It is not so necessary."
echo "Edit /var/lib/dpkg/status file after you have installed slack."
# Setup vagrant
echo "setting up vagrant VM"
cd ~/Documents
vagrant init ubuntu/trusty64
vagrant up
vagrant halt
