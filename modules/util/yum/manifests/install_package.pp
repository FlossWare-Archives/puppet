define yum::install_package ( $packages ) {
    #
    # Just making sure there are packages to install...
#
	if $packages != '' {
		package {
			$packages:
				ensure => installed,
		}
	}
}
