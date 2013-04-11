class webadmin::params {
  $base_packages = [
    'byobu',
    'curl',
    'ntp',
    'screen',
    'wget',
    'zip',
    'openssh-server',
    'vim-common',
  ]
  case $::osfamily {
    'RedHat': {
      $bashrc_location = "/etc/bashrc"
      $inputrc_location = "/etc/inputrc"
      $rehl_packages = [
         'ctags',
         'openssh-clients',
         'vim-enhanced'
      ]
      $packages = concat($base_packages, $rehl_packages)
    }
    'Debian': {
  	  $inputrc_location = "/etc/bash.bashrc"
  	  $inputrc_location = "/etc/inputrc"
      $deb_packages = [
        'mailutils', # TODO: Does this package belong in this module?
        'vim',
        'vim-runtime',
        'vim-tiny',
        'openssh-client',
        'exuberant-ctags',
      ]
      $packages = concat($base_packages, $deb_packages)
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat and Debian.")
    }
  }
}