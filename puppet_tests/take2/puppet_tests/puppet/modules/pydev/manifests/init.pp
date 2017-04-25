# == Class: pydev
#
# Install python modules for ORM
# Install flask
#
class pydev {
# Install basics utilities
  package { ['python3-pip', 'python3-dev', 'libmysqlclient-dev']:
    ensure   => 'installed',
    require  => 'apt-get update',
  }
  package { ['mysqlclient', 'sqlalchemy', 'Flask', 'pep8']:
    ensure   => 'installed',
    provider => 'pip3',
  }
}
