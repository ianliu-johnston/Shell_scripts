#include devbase
include apt

#exec { 'apt-get update':
#  command        => 'apt-get update',
#  path           => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'],
#}

#class {'::mysql::server':
#  root_password  => 'faker',
##  package_ensure => 'mysql-5.7',
#  require        => Exec['apt-get update'], 
#}
