class gnome {
    exec { "Gnome Dependencies":
        command    => "/usr/bin/yum groupinstall -y base-x gnome-desktop ; /usr/bin/yum install -y xorg-x11-fonts*",
        cwd        => "/",
        timeout    => "1800",
        unless     => "which gnome-session",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   

    include xscreensaver
}

