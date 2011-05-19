class yum::fedora::everything {
    yumrepo {
        fedora-everything:
            name         => "fedora-everything",
            mirrorlist   => "http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-${operatingsystemrelease}&arch=${architecture}",
            enabled      => "1",
            enablegroups => "1",
            gpgcheck     => "0",
    }
}
