class yum::centos::rpmforge {
    case $lsbmajdistrelease {
        5: {
            case $architecture {
                x86_64: {
                    $RPM = "http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm"
                }

                default: {
                    $RPM = "http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.i386.rpm"
                }
            }
        }

        6: {
            case $architecture {
                x86_64: {
                    $RPM = "http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm"
                }

                default: {
                    $RPM = "http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.i686.rpm"
                }
            }
        }

		default: {
			fail ( "Cannot process this CentOS version [${lsbmajdistrelease}]" )
    }

	yum::install_repo {
		"centos-${lsbmajdistrelease}-rpmforge":
			repoName => "rpmforge",
			rpm      => "${RPM}",
	}
}