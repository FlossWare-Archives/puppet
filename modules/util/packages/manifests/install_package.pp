define packages::install_package ( $packages ) {
    package {
		"${packages}":
        	ensure => installed,
    }
}