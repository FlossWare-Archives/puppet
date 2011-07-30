define util::install_group ( $group = $name, $unless = '', $timeout = '', $path = '' ) {
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

    $execName = "exec-${group}"

	if $unless {
		exec {
            $execName:
                command    => "/usr/bin/yum groupinstall -y ${group}",
                cwd        => "/",
                timeout    => $executeTimeout,
                unless     => "which ${unless}",
                path       => $executePath,
		}   
	} else {
		exec {
            $execName:
                command    => "/usr/bin/yum groupinstall -y ${group}",
                cwd        => "/",
                timeout    => $executeTimeout,
                path       => $executePath,
		}   
	}
}
