# == Class: mysql setup 
#
# setup mysql server and sqlalchemy
#
class mysql {
  exec { 'grab_mysql_5.7':
    command => 'wget https://dev.mysql.com/get/mysql-apt-config_0.8.3-1_all.deb -O /home/vagrant/mysql_apt.deb',
    path    => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'];
  }
  exec { 'configure_apt':
    command => 'sudo dpkg -i /home/vagrant/mysql_apt.deb',
    path    => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'];
  }
  exec { 'apt-get update':
    command => 'apt-get update',
    path    => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'];
  }
  exec { 'apt-get upgrade':
    command  => 'apt-get upgrade -y',
    path     => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'];
  }
  package { ['mysql-server', 'python3-dev', 'libmysqlclient-dev']:
    ensure  => 'installed';
  }
  service { 'mysql':
    ensure  => 'running';
  }
# Cleanup
  file { '/home/vagrant/mysql_apt.deb':
    ensure  => absent;
  }
}
