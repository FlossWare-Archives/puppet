# This class grabs the remote rpmfusion rpms and installs them for CentOS.
#
# == Variables
#
# [*$FREE_RPM*]
#    The name of the free RPM to download from RPM Fusion to install.
#
# [*$NONFREE_RPM*]
#    The name of the nonfree RPM to download from RPM Fusion to install.
#
# [*$FREE_BASE_URL*]
#    The "base" portion of the URL for downloading the free RPM Fusion rpms.
#
# [*$NONFREE_BASE_URL*]
#    The "base" portion of the URL for downloading the nonfree RPM Fusion rpms.
#
# [*$FREE_RPM_URL*]
#    The URL for the free RPM for RPM Fusion that'll be installed as repo.
#
# [*$NONFREE_RPM_URL*]
#    The URL for the nonfree RPM for RPM Fusion that'll be installed as repo.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::rpmfusion {
    $FREE_BASE_URL    = "http://download1.rpmfusion.org/free/el/updates/testing/${::lsbmajdistrelease}/${::architecture}"
    $NONFREE_BASE_URL = "http://download1.rpmfusion.org/nonfree/el/updates/testing/${::lsbmajdistrelease}/${::architecture}"

    case $::lsbmajdistrelease {
        5: {
            $FREE_RPM    = 'rpmfusion-free-release-5-0.1.noarch.rpm'
            $NONFREE_RPM = 'rpmfusion-nonfree-release-5-0.1.noarch.rpm'
        }

        6: {
            $FREE_RPM    = 'rpmfusion-free-release-6-0.1.noarch.rpm'
            $NONFREE_RPM = 'rpmfusion-nonfree-release-6-0.1.noarch.rpm'
        }

        default: {
            fail ( "Cannot process CentOS version [${lsbmajdistrelease}]" )
        }
    }

    $FREE_RPM_URL = "${FREE_BASE_URL}/${FREE_RPM}"

    util::install_remote_repo_def {
        "centos-${::lsbmajdistrelease}-rpmfusion-free":
            repoName  => 'rpmfusion-free-updates',
            remoteRpm => $FREE_RPM_URL,
    }

    $NONFREE_RPM_URL = "${NONFREE_BASE_URL}/${NONFREE_RPM}"

    util::install_remote_repo_def {
        "centos-${::lsbmajdistrelease}-rpmfusion-nonfree":
            repoName  => 'rpmfusion-nonfree-updates',
            remoteRpm => $NONFREE_RPM_URL,
    }
}
