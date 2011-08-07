# This class installs/enables repos for Fedora.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::fedora {
    include yum::fedora::everything
    include yum::fedora::updates
    include yum::fedora::rpmfusion
}
