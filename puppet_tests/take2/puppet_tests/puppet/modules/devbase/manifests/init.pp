# == Class: devbase
#
# Sets up customized bash
#
class devbase {
# Install basics utilities
  package { ['git', 'p7zip-full']:
    ensure   => 'installed';
  }
  file {
    '/home/vagrant/.bashrc':
      owner  => 'vagrant',
      group  => 'vagrant',
      mode   => '0644',
      source => 'puppet:///modules/devbase/bashrc';
  }
  file {
    '/home/vagrant/.bash_aliases':
      owner  => 'vagrant',
      group  => 'vagrant',
      mode   => '0644',
      source => 'puppet:///modules/devbase/bash_aliases';
  }
  file {
    '/home/vagrant/.vimrc':
      owner  => 'vagrant',
      group  => 'vagrant',
      mode   => '0644',
      source => 'puppet:///modules/devbase/vimrc';
  }
  file {
    '/home/vagrant/.ssh/config':
      owner  => 'vagrant',
      group  => 'vagrant',
      mode   => '0600',
      source => 'puppet:///modules/devbase/sshconfig';
  }
  file {
    '/home/vagrant/.vim':
      owner  => 'vagrant',
      group  => 'vagrant',
      mode   => '0644',
      source => 'puppet:///modules/devbase/vim',
      recurse => true;
  }
  file {
    '/home/vagrant/pre-commit':
      owner  => 'vagrant',
      group  => 'vagrant',
      mode   => '0744',
      source => 'puppet:///modules/devbase/pre-commit';
  }
  file {
    '/home/vagrant/update.sh':
      owner  => 'vagrant',
      group  => 'vagrant',
      mode   => '0744',
      source => 'puppet:///modules/devbase/update.sh';
  }
  file {
    '/home/vagrant/.gitconfig':
      owner  => 'vagrant',
      group  => 'vagrant',
      mode   => '0744',
      source => 'puppet:///modules/devbase/gitconfig';
  }
}
