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
			repoName => 'epel',
			rpm      => $RPM_URL,
	}
}
