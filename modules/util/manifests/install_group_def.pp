# This will install a group package.  To stop this from being called, if the group contains an app,
# you may specify the app via the $unless param (meaning if this app is not found, an attempt will be
# made to install the group).
#
# == Parameters
#
# [*$group*]
#     The name of the rpm group package to install.
#
# [*$unless*]
#     The name of an app, that if found will not attempt to install $group.
#
# [*$timeout*]
#     When installing an RPM group, the maximum time allowed for installation.
#
# [*$path*]
#     An alternate executable path to use when installing $group.
#
# == Variables
#
# [*$executeTimeout*]
#     When installing $group, the maximum time allowed to install the group.
#
# [*$execName*]
#     The name used on exec when installing $group.
#
# == Examples
#
#    util::install_group_def {
#        'kde':
#            group   => 'kde-desktop',
#            unless  => 'startkde',
#            timeout => '8000000',
#            path    => [ '/usr/bin', '/sbin', '/bin' ],
#    }
#
#    util::install_group_def {
#        'kde-desktop':
#            unless  => 'startkde',
#    }
#
#    util::install_group_def {
#        'kde-desktop':
#    }
#
# == Authors
#
#     Scot P. Floess <flossware@gmail.com>
#
define util::install_group_def ($group = $name, $unless = undef, $timeout = undef, $path = undef) {
	include defaults
	
	if $timeout {
		$executeTimeout = $timeout
	} else {
		$executeTimeout = $defaults::timeout
	}

	if $path {
		$executePath = $path
    } else {
		$executePath = $defaults::path
	}

    $execName = "exec_${name}_${group}"

	if $unless {
		exec {
            $execName:
                command    => "yum groupinstall -y ${group}",
                cwd        => "/",
                timeout    => $executeTimeout,
                unless     => "which ${unless}",
                path       => $executePath,
		}   
	} else {
		exec {
            $execName:
                command    => "yum groupinstall -y ${group}",
                cwd        => "/",
                timeout    => $executeTimeout,
                path       => $executePath,
		}   
	}
}
