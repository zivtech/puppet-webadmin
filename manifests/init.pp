class webadmin {
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
    require => [ File["/usr/src/git_sh_1.1.deb"], Package["git-core"] ],
  }
}