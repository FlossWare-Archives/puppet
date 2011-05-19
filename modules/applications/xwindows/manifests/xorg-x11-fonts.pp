class xwindows::xorg-x11-fonts {
	include common

    exec { "XWindows Dependencies":
        command    => "yum install -y xorg-x11-fonts*",
        cwd        => "/",
        timeout    => "${common_execTimeout}",
        #unless     => "which startx",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   

}