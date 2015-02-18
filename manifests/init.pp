# Package lists and user settings for administrative user.
class webadmin($webadminuser = "webadmin", $webadmingroup = "webadmin") inherits webadmin::params {

  require git

  package { 'byobu':
    ensure => 'present',
  }

  package { 'curl':
    ensure => 'present',
  }

  package { 'ntp':
    ensure => 'present',
  }

  package { 'screen':
    ensure => 'present',
  }

  package { 'wget':
    ensure => 'present',
  }

  package { 'zip':
    ensure => 'present',
  }

  package { 'vim-common':
    ensure => 'present',
  }

  package { 'lynx':
    ensure => 'present',
  }

  if ($webadmin::params::platform_include) {
    include $webadmin::params::platform_include
  }

  file { "$webadmin::params::vimrc_path":
    ensure => present,
    mode => 644,
    source => "puppet:///modules/webadmin/${webadmin::params::vimrc}",
  }

  file { $webadmin::params::bashrc_location:
    ensure => present,
    owner => root,
    group => root,
    mode => 644,
    source => "puppet:///modules/webadmin/bash.bashrc",
  }

  file { $webadmin::params::inputrc_location:
    ensure => present,
    owner => root,
    group => root,
    mode => 644,
    source => "puppet:///modules/webadmin/inputrc",
  }

  file { "/etc/gitconfig":
    ensure => present,
    owner => root,
    group => root,
    mode => 644,
    source => "puppet:///modules/webadmin/gitconfig"
  }

  file { '/usr/share/git-core/templates/info/exclude':
    source => "puppet:///modules/webadmin/git_ignore",
    owner => root,
    group => root,
    mode => 655,
  }

  file { '/usr/share/git-core/templates/info/attribute':
    source => "puppet:///modules/webadmin/git_attribute",
    owner => root,
    group => root,
    mode => 655,
  }

  # TODO: Fixme for CentOS
  file { '/usr/local/bin/runtags':
    source => "puppet:///modules/webadmin/runtags",
    owner => 'root',
    group => 'root',
    mode => 755,
  }

  file { '/usr/local/bin/network-restart':
    source => "puppet:///modules/webadmin/network-restart",
    owner => 'root',
    group => 'root',
    mode => 755,
  }

  file { '/usr/local/bin/make-random-password':
    source => "puppet:///modules/webadmin/make-random-password",
    owner => 'root',
    group => 'root',
    mode => 755,
  }
}
