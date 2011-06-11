class yum::centos::rpmfusion {
    $FREE_BASE_URL    = "http://download1.rpmfusion.org/free/el/updates/testing/${::lsbmajdistrelease}/${::architecture}"
    $NONFREE_BASE_URL = "http://download1.rpmfusion.org/nonfree/el/updates/testing/${::lsbmajdistrelease}/${::architecture}"

    case $::lsbmajdistrelease {
        5: {
            $FREE_RPM    = 'rpmfusion-free-release-5-0.1.noarch.rpm'
            $NONFREE_RPM = 'rpmfusion-nonfree-release-5-0.1.noarch.rpm'
        }

        default: {
            fail ( "Cannot process CentOS version [${lsbmajdistrelease}]" )
        }
    }

    yum::install_repo {
        "centos-${::lsbmajdistrelease}-rpmfusion-free":
            repoName => 'rpmfusion-free-updates',
            rpm      => "${FREE_BASE_URL}/${FREE_RPM}",
    }

    yum::install_repo {
        "centos-${::lsbmajdistrelease}-rpmfusion-nonfree":
            repoName => 'rpmfusion-nonfree-updates',
            rpm      => "${NONFREE_BASE_URL}/${NONFREE_RPM}",
    }
}
