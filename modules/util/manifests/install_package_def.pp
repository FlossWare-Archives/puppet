# Will install a package assuming $package is defined.
#
# == Parameters
#
# [*$packages*]
#     The package(s) to install.
#
# == Examples
#
#    util::install_package_def {
#        'mypackages':
#            packages => [ 'foo', 'bar', 'alpha' ],
#    }
#
#    util::install_package_def {
#        'foo':
#    }
#
# == Authors
#
#     Scot P. Floess <flossware@gmail.com>
#
define util::install_package_def ($packages = $name) {
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
