# Misc collection of Bash Scripts for setting up systems 

## Description of Files
<h6>keygenssh</h6>
  * sshGITHUB.sh - Script to setup github keys

<h6>laptop_setup</h6>
  * links.md - Helpful links
The following files get copied to the home directory, prepending a `.`:
  * bash_aliases - Useful bash aliases.
  * config - Config file for local ssh preferences
  * emacsrc - Config file for emacs
  * pre-commit - Precommit hook for git repositories that check style before commiting
  * tmux.conf - Config file for Tmux
  * vim/ - Plugins for vim
  * vimrc - Config file for Vim
  * Xmodmap - Config file for Xmodmap
Run this script to configure the system
  * setup_laptop.sh - Setup script for new installations of Lubuntu

<h6>port_knocksetup</h6>
Script to setup port knocking on a linux system
  * knockd.conf - This script gets copied to the box you want to ssh into. Make sure to change the sequence to something unique.
  * setup.sh - Setup your the box you want to ssh into.
  * sshd_config - The ssh setup file. Replaces ``/etc/ssh/sshd_config``
  * knock_knock - Script to ssh into your box after port knocking, the sequence should match the sequence in knockd.conf

<h6>print_console_colors.sh</h6>
Simple script that just prints out all the console colors

<h6>setupBash</h6>
Similar to laptop setup, but is especially for configuring a development environment in a virtual machine. 
  * setupBash.sh - Run this script for the development environment


The following files get copied into the home directory with a `.` prepended:
  * bash_aliases - Helpful aliases in bash
  * config - Config file for local ssh preferences
  * emacsrc - Config file for Emacs
  * pre-commit - Precommit hook for git repositories that check style before commiting
  * vim/ - Plugins for Vim
  * vimrc - Config file for Vim

<h6>wallpaper.jpg</h6>
My awesome wallpaper that I love(for some weird reason).
