# == Class: pydev
#
# Install python modules for ORM
# Install flask
#
class pydev {
# Install basics utilities
  package { ['python3-pip', 'python3-dev', 'libmysqlclient-dev']:
    ensure   => 'installed',
  }
  exec { 'install python modules':
    command  => 'sudo -H pip3 install mysqlclient sqlalchemy Flask pep8',
    path     => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'],
    require  => Package['python3-pip', 'python3-dev', 'libmysqlclient-dev'],
  }
}
