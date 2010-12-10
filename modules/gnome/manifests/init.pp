class gnome {
    include xwindows

    exec { "Gnome Dependencies":
        command    => "/usr/bin/yum groupinstall -y gnome-desktop",
        cwd        => "/",
        timeout    => "1800",
        unless     => "which gnome-session",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   

    include xscreensaver
}

