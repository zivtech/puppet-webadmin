# Class: webadmin::platform::redhat
#
#
class webadmin::platform::redhat {

  ensure_packages(['openssh-clients', 'ctags'])

}
