# Class: webadmin::platform::redhat
#
#
class webadmin::platform::redhat {

  package { 'ctags':
    ensure => 'present',
  }

  package { 'openssh-clients':
    ensure => 'present',
  }

  package { 'vim-enhanced:
    ensure => 'present',
  }

}
