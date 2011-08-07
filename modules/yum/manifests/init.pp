# This class enables/installs repos for Fedora and CentOS.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum {
    case $::operatingsystem {
        CentOS: {
            include yum::centos
        }

        Fedora: {
            include yum::fedora
        }
    }
}
