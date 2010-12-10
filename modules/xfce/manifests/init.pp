ass desktop::xfce {
    exec { "XFCE Dependencies":
        command    => "/usr/bin/yum groupinstall -y base-x XFCE ; /usr/bin/yum install -y xorg-x11-fonts*",
        cwd        => "/",
        timeout    => "1800",
        unless     => "which startxfce4",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   
}
