# Class: mysql
#
# Sets up the mysql instance
#
class mysql {
  file {
    '/tmp/install.sh':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
    source => 'puppet:///modules/mysql/install.sh',
    notify => Exec['run script'],
  }  
  exec { 'run script':
    command => '/tmp/install.sh',
    path   => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'],
  }
}
