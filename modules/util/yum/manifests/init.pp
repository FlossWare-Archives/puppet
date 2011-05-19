class yum {
    case $::operatingsystem {
        CentOS: {
            include yum::centos
        }

        Fedora: {
            include yum::fedora
        }
    }

    yumrepo {
        "${::operatingsystem}-${::operatingsystemrelease}-flossware-${::architecture}":
            name         => "flossware",
            baseurl      => "http://adminserver:80/cobbler/repo_mirror/${::operatingsystem}-${::operatingsystemrelease}-flossware-${::architecture}",
            enabled      => "1",
            enablegroups => "1",
            gpgcheck     => "0",
    }
}
