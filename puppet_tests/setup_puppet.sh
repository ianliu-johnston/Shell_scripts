#!/bin/bash
#LINKS: https://github.com/patrickdlee/vagrant-examples
sudo apt-get install puppet-common
puppet module install --modulepath modules puppetlabs-mysql
puppet module install --modulepath modules puppetlabs-apt --version 3.0.0
