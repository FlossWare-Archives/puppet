define util::install_package_def ($packages) {
    #
    # Just making sure there are packages to install...
    #
	if $packages {
		package {
			$packages:
				ensure => installed,
		}
	}
}
