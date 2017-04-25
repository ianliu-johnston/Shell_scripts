# Setup development environment with Puppet
This is a framework that can also be applied to server code.

## Install
This build requires Vagrant and Virtualbox. Both of which provide fulfill all other dependencies.

## Run
Simply run ``vagrant up`` in the directory that contains the Vagrant file, and it configures a virtual machine with a pre-configured development environment.

## Packages installed in virtual development environment:

### Debuggers
``radare2``, ``valgrind``, ``tshark``, ``gdb``, 

### Development Languages
``flask``, ``python3-pip``, ``sqlalchemy``, ``mysqlclient``, ``mysql-5.7``, ``nodejs``, ``npm``, 

### Style Checkers
``shellcheck``(Shell Scripting),``pep8``(Python), ``Betty`` (C language), ``W3C-Validator`` (HTML) 

## Utilities
``emacs``, ``p7zip-full``, ``docker``, ``docker.io`` 

## Additional functionality
Installs git precommit hooks, customizes git, configures a customized bash environment, customized vim environment, configures ssh to use a github key, and clones the relivent development git repositories.

##LINKS
[Examples from Github](https://github.com/patrickdlee/vagrant-examples) -- This was a very helpful example repository to build off of.
