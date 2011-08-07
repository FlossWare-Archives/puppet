# This class downloads the CentOS rpmforge rpm repo and installs it.
#
# == Variables
#
# [*$RPM*]
#     The RPM name to download and install from rpmforge.
#
# [*$BASE_URL*]
#     The base URL from which to download the rpmforge RPM repo.
#
# [*$RPM_URL*]
#     The URL for the RPM to download and install from rpmforge.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::rpmforge {
    case $lsbmajdistrelease {
        5: {
            case $architecture {
                x86_64: {
                    $RPM = 'rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm'
                }

                default: {
                    $RPM = 'rpmforge-release-0.5.2-2.el5.rf.i386.rpm'
                }
            }
        }

        6: {
            case $architecture {
                x86_64: {
                    $RPM = "rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm"
                }

                default: {
                    $RPM = "rpmforge-release-0.5.2-2.el6.rf.i686.rpm"
                }
            }
        }

		default: {
			fail ( "Cannot process this CentOS version [${lsbmajdistrelease}]" )
        }
    }

    $BASE_URL = 'http://packages.sw.be/rpmforge-release'
    $RPM_URL  = "${BASE_URL}/${RPM}"

	util::install_remote_repo_def {
		"centos-${lsbmajdistrelease}-rpmforge":
			repoName  => 'rpmforge',
			remoteRpm => $RPM_URL,
	}
}
