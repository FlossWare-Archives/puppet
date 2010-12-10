class xwindows {
    exec { "XWindows Dependencies":
        command    => "/usr/bin/yum groupinstall -y base-x ; /usr/bin/yum install -y xorg-x11-fonts*",
        cwd        => "/",
        timeout    => "1800",
        unless     => "which startx",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   

}
