# == Class: mysql setup 
#
# setup mysql server and sqlalchemy
#
class {'mysql::server':
  root_password    => 'faker',
  package_ensure   => '5.7.18',
  service_name     => 'mysql',
}
class mysql_python {
  package { ['python3-dev', 'libmysqlclient-dev']:
    ensure         => 'installed',
  }
}
