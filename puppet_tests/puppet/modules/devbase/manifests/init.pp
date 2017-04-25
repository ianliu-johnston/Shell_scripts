# == Class: devbase 
#
# setup the development base
#
class devbase {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }
  
  package { ['git', 'tshark']:
    ensure => present;
  }

  file { '/home/vagrant/.bashrc':
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   => '0644',
    source => 'puppet:///modules/devbase/bashrc';
  }
  file { '/home/vagrant/.vimrc':
    owner  => 'vagrant',
    group  => 'vagrant',
    mode   => '0644',
    source => 'puppet:///modules/devbase/vimrc';
  }
}
