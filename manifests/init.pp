class webadmin($webadminuser = "webadmin", $webadmingroup = "webadmin") {

  # Copy our git-sh deb package into the vm for ins
  file { "/usr/src/git_sh_1.1.deb":
    owner => root,
    group => root,
    mode => 644,
    ensure => file,
    source => "puppet:///modules/webadmin/git_sh_1.1.deb",
  }

  package { "git-core":
    ensure => installed,
  }

  package { "git-sh":
    ensure => installed,
    provider => 'dpkg',
    source => "/usr/src/git_sh_1.1.deb",
    require => [ File["/usr/src/git_sh_1.1.deb"], Package["base-package"] ],
  }

  package { 'base-package': 
    name => [
        'screen',
        'byobu',
        'vim',
        'vim-common',
        'vim-runtime',
        'vim-tiny',
        'wget',
        'curl',
        'ntp',
        'openssh-client',
        'openssh-server',
        'openssl',
        'iptables',
        'postfix',
        'mailutils',
        'zip',
        'exuberant-ctags',
      ],
      ensure => installed,
  }

  group { ["www-data", "tomcat6"] :
    ensure => 'present',
  }

  file { "/etc/vim/vimrc":
    ensure => present,
    mode => 644,
    source => "puppet:///modules/webadmin/vimrc",
  }

  file { "/etc/bash.bashrc":
    ensure => present,
    owner => root,
    group => root,
    mode => 644,
    source => "puppet:///modules/webadmin/bash.bashrc",
  }

  file { "/etc/inputrc":
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

  # TODO: Not sure what to do with this in the new world.
  /*
  file { 'managed sudo':
    path => "/etc/sudoers",
    owner => root,
    group => root,
    mode => 440,
    source => "puppet:///modules/webadmin/sudoers",
  }
  */

  file { '/usr/share/git-core/templates/info/exclude':
    require => Package['base-package'],
    source => "puppet:///modules/webadmin/git_ignore",
    owner => root,
    group => root,
    mode => 655,
  }

  cron { "ntp time sync":
    command => "/usr/sbin/ntpdate ntp.ubuntu.com",
    user => root,
    minute => ['*/3'],
  }
}