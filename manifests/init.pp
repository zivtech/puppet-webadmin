# Package lists and user settings for administrative user.
class webadmin($webadminuser = "webadmin", $webadmingroup = "webadmin") inherits webadmin::params {

  ensure_resource('package', 'git', {'ensure' => 'installed' })
  /*
  # Our home built package is only for i386...
  if ($architecture == 'i386') {
    # Copy our git-sh deb package into the vm for ins
    file { "/usr/src/git_sh_1.1.deb":
      owner => root,
      group => root,
      mode => 644,
      ensure => file,
      source => "puppet:///modules/webadmin/git_sh_1.1.deb",
    }


    package { "git-sh":
      ensure => installed,
      provider => 'dpkg',
      source => "/usr/src/git_sh_1.1.deb",
      require => [ File["/usr/src/git_sh_1.1.deb"], Package["base-package"] ],
    }
  }
  */


    # TODO: Fixme for CentOS
  package { 'base-package':
    name => $webadmin::params::packages,
    ensure => installed,
  }
/*
  group { ["www-data", "tomcat6"] :
    ensure => 'present',
  }

  file { "/etc/vim/vimrc":
    ensure => present,
    mode => 644,
    source => "puppet:///modules/webadmin/vimrc",
  }
  */

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
    require => Package['base-package'],
    source => "puppet:///modules/webadmin/git_ignore",
    owner => root,
    group => root,
    mode => 655,
  }

  file { '/usr/share/git-core/templates/info/attribute':
    require => Package['base-package'],
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
