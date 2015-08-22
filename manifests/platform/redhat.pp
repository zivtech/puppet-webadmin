# Class: webadmin::platform::redhat
#
#
class webadmin::platform::redhat (
  $packages = [
    'openssh-clients',
    'ctags',
  ]
) {

  ensure_packages($packages)

}
