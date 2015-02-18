class webadmin::params {
  $base_packages = [
  ]
  case $::osfamily {
    'RedHat': {
      $platform_include = '::webadmin::platform::redhat'
      $bashrc_location = "/etc/bashrc"
      $inputrc_location = "/etc/inputrc"
      $vimrc_path = '/etc/vimrc'
      $vimrc = 'redhat.vimrc'
    }
    'Debian': {
      $platform_include = '::webadmin::platform::debian'
  	  $bashrc_location = "/etc/bash.bashrc"
  	  $inputrc_location = "/etc/inputrc"
      $vimrc_path = '/etc/vim/vimrc'
      $vimrc = 'debian.vimrc'
    }
    default: {
      $platform_include = false
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat and Debian.")
    }
  }
}
