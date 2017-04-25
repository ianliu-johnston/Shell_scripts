# Class: mysql
#
# Sets up the mysql instance
#
class mysql {
  exec { 'wget sql_apt':
    command        => 'wget https://dev.mysql.com/get/mysql-apt-config_0.8.4-1_all.deb -O /tmp/mysql-apt-config_0.8.4-1_all.deb',
    path           => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'];
  }
  exec { 'dpkg apt_repo':
    environment    => ['DEBIAN_FRONTEND=noninteractive'],
    command        => 'dpkg -i /tmp/mysql-apt-config_0.8.4-1_all.deb',
    path           => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'],
    require        => Exec['wget sql_apt'],
  }
  exec { 'config mysql before install':
    command        => 'echo mysql-server mysql-server/root_password select faker | sudo debconf-set-selections',
    path           => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'],
    require        => Exec['dpkg apt_repo'],
  }
  exec { 'config mysql before install repeat':
    command        => 'echo mysql-server mysql-server/root_password_again select faker | sudo debconf-set-selections',
    path           => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'],
    require        => Exec['dpkg apt_repo'],
  }
  exec { 'apt-get update':
    command        => 'apt-get update',
    path           => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'],
    require        => Exec['config mysql before install'],
  }
  package { 'mysql-server':
    ensure         => installed,
    require        => Exec['apt-get update'],
  }
  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'];
  }
}
