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
