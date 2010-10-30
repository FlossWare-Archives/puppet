class kde {
    exec { "KDE Dependencies":
        command    => "/usr/bin/yum groupinstall -y base-x kde-desktop ; /usr/bin/yum install -y xorg-x11-fonts*",
        cwd        => "/",
        timeout    => "1800",
        unless     => "which startkde",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   

    include xscreensaver
}

