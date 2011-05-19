class yum::fedora::rpmfusion {
    case $lsbmajdistrelease {
        15 : {
            yum::install_repo {
                fedora-15-rpmfusion-free:
                    repoName => "rpmfusion-free-updates",
                    rpm      => "http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-rawhide.noarch.rpm",
            }

            yum::install_repo {
                fedora-15-rpmfusion-nonfree:
                    repoName => "rpmfusion-nonfree-updates",
                    rpm      => "http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-rawhide.noarch.rpm",
            }
        }

        default: {
            yum::install_repo {
                fedora-rpmfusion-free:
                    repoName => "rpmfusion-free-updates",
                    rpm      => "http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm",
            }

            yum::install_repo {
                fedora-rpmfusion-nonfree:
                    repoName => "rpmfusion-nonfree-updates",
                    rpm      => "http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm",
            }
        }
    }
}
