#!/bin/bash
echo "This script is for customization on Lubuntu v.16.04"
echo "Run this script in sudo mode."
# Install all tools I need.
apt-get update
echo "installing utils"
apt-get install -y git p7zip-full emacs exfat-fuse exfat-utils vlc tmux
apt-get install -y pavucontrol virtualbox vagrant
echo "Installing dev tools"
apt-get install -y gdb radare2 valgrind gcc-4.8 gcc docker docker.io
if [[ "$1" == "h4xx0r"]]; then
	echo "133t mode"
	apt-get install -y hydra aircrack-ng nmap tor privoxy whois john
fi
# Uninstall any I don't need
echo "removing unnecessary apps + dirs"
apt-get purge -y pidgin pidgin-data gnumeric mplayer gnome-mplayer
apt-get purge -y audacious audacious-plugins audacious-plugins-data
apt-get purge -y sylpheed sylpheed-doc sylpheed-i18n sylpheed-plugins
apt autoremove
rm -v ~/Pictures ~/Templates ~/Videos
# Clone repos I work with.
# Run batch script to setup customizations in bash and vim, etc.
echo "Setting up Bash customizations"
git clone https://github.com/ianliu-johnston/BatchScripts.git ~/Documents/BatchScripts
cd ~/BatchScripts/setupBash
./setupBash.sh
# Setup python dependencies that I like.
sudo pip install fabric
# Setup custom aliases
echo "alias battinfo='upower -i $(upower -e | grep \"battery\") | grep -E \"percent| time\"'" >> ~/.bash_aliases
echo "alias padoff=\"xinput --disable 12\"" >> ~/.bash_aliases
echo "alias padon=\"xinput --enable 12\"" >> ~/.bash_aliases
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
