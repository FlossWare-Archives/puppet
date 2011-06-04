class yum::centos::epel {
    $BASE_URL = "http://download.fedora.redhat.com/pub/epel/${lsbmajdistrelease}/${architecture}"

    case $lsbmajdistrelease {
        5: {
            $RPM = "epel-release-5-4.noarch.rpm"
        }

        6: {
            $RPM = "epel-release-6-5.noarch.rpm"
        }

		default: {
			fail ( "Cannot process this CentOS version [${lsbmajdistrelease}]" )
        }
    }

	yum::install_repo {
		"epel-${lsbmajdistrelease}":
			repoName => 'epel',
			rpm      => "${BASE_URL}/${RPM}",
	}
}
