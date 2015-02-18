# Class: webadmin::platform::debian
#
#
class webadmin::platform::debian {

  package {   'mailutils':
    ensure => 'present',
  }

  package { 'vim':
    ensure => 'present',
  }

  package { 'vim-runtime':
    ensure => 'present',
  }

  package { 'vim-tiny':
    ensure => 'present',
  }

  package { 'openssh-client':
    ensure => 'present',
  }

  package { 'exuberant-ctags':
    ensure => 'present',
  }

}
