# Class: webadmin::platform::debian
#
#
class webadmin::platform::debian (
  $packages = [
    'mailutils',
    'vim',
    'vim-runtime',
    'vim-tiny',
    'openssh-client',
    'exuberant-ctags',
  ]
) {

  ensure_packages($packages)
}
