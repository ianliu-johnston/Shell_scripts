# Class: nodejs
#
# installs and configures nodejs and npm packages
#
class nodejs {
  exec { 'curl config':
    command        => 'curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -',
    path           => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'];
  }
  package { 'nodejs':
    ensure         => installed,
  }
  exec { 'npm install semistandard':
    command        => 'npm install semistandard --global',
    path           => ['/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'],
    require        => Package['nodejs'],
  }
}
