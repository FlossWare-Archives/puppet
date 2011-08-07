# This class downloads the CentOS epel rpm repo and installs it.
#
# == Variables
#
# [*$RPM*]
#     The name of the RPM to download and install from EPEL.
#
# [*$BASE_URL*]
#     The "base" URL from which to download the EPEL rpm for installation.
#
# [*$RPM_URL*]
#     The actual URL for the RPM to download and install from EPEL.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::epel {
    case $lsbmajdistrelease {
        5: {
            $RPM = 'epel-release-5-4.noarch.rpm'
        }

        6: {
            $RPM = 'epel-release-6-5.noarch.rpm'
        }

		default: {
			fail ( "Cannot process this CentOS version [${lsbmajdistrelease}]" )
        }
    }

    $BASE_URL = "http://download.fedora.redhat.com/pub/epel/${lsbmajdistrelease}/${architecture}"
    $RPM_URL  = "${BASE_URL}/${RPM}"

	util::install_remote_repo_def {
		"epel-${lsbmajdistrelease}":
			repoName  => 'epel',
			remoteRpm => $RPM_URL,
	}
}
