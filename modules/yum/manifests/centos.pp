# This class ensure all centos related repos are installed and enabled -
# centosplus, contrib, extras, updates, epel, rpmforge and rpmfusion.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos {
    include yum::centos::centosplus
    include yum::centos::contrib
    include yum::centos::extras
    include yum::centos::updates
    include yum::centos::epel
    include yum::centos::rpmforge
    include yum::centos::rpmfusion
}
