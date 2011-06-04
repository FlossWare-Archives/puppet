class yum::fedora::updates {
    yumrepo {
        'fedora-updates':
            #baseurl      => "http://download.fedora.redhat.com/pub/fedora/linux/releases/$lsbdistrelease/Everything/$hardwaremodel/os",
            name         => 'fedora-updates',
            mirrorlist   => "http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f${operatingsystemrelease}&arch=${architecture}",
            enabled      => '1',
            enablegroups => '1',
            gpgcheck     => '0',
    }
}