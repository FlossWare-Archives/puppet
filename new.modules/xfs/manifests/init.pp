class services::xfs {
    $packages = [
        "xorg-x11-xfs",
    ]

    package { $packages:
        ensure => latest,
        notify => Service [ 'xfs' ]
    }   

	service { 'xfs':
		ensure  => running,
		enable  => true,
	}   
}
