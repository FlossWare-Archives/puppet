define install_group ( $group, $unless = '', $timeout = '', $path = '' ) {
	include defaults
	
	if $timeout != '' {
		$executeTimeout = $timeout
	} else {
		$executeTimeout = $defaults::timeout
	}

	if $path != '' {
		executePath = $path
    } else {
		executePath = $defaults::path
	}

	if $unles != '' {
		exec {
			command    => "/usr/bin/yum groupinstall -y ${group}",
			cwd        => "/",
			timeout    => "${executeTimeout}",
			unless     => "which ${unless}",
			path       => "${executePath}",
		}   
	} else {
		exec {
			command    => "/usr/bin/yum groupinstall -y ${group}",
			cwd        => "/",
			timeout    => "${executeTimeout}",
			path       => "${executePath}",
		}   
	}
}