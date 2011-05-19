class yum::centos::rpmfusion {
    case $lsbmajdistrelease {
        5: {
            yum::install_repo {
                centos-5-rpmfusion-free:
                    repoName => "rpmfusion-free-updates",
                    rpm      => "http://download1.rpmfusion.org/free/el/updates/testing/${lsbmajdistrelease}/${architecture}/rpmfusion-free-release-5-0.1.noarch.rpm",
            }

            yum::install_repo {
                centos-5-rpmfusion-nonfree:
                    repoName => "rpmfusion-nonfree-updates",
                    rpm      => "http://download1.rpmfusion.org/nonfree/el/updates/testing/${lsbmajdistrelease}/${architecture}/rpmfusion-nonfree-release-5-0.1.noarch.rpm",
            }
        }
    }
}
