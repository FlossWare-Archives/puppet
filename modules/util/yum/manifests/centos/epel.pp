class yum::centos::epel {
    case $lsbmajdistrelease {
        5: {
            $RPM = "http://download.fedora.redhat.com/pub/epel/${lsbmajdistrelease}/${architecture}/epel-release-5-4.noarch.rpm"
        }

        6: {
            $RPM = "http://download.fedora.redhat.com/pub/epel/${lsbmajdistrelease}/${architecture}/epel-release-6-5.noarch.rpm"
        }
    }

    if $RPM {
        yum::install_repo {
            "epel-${lsbmajdistrelease}":
                repoName => "epel",
                rpm      => "${RPM}",
        }
    }
}
