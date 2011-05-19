class xwindows::base-x {
	include common

    exec { "XWindows Base-X Dependency":
        command    => "yum groupinstall -y base-x",
        cwd        => "/",
        timeout    => "${common_execTimeout}",
        #unless     => "which startx",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   
}