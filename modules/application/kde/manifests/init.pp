class kde {
    include xwindows

    exec { "KDE Dependencies":
        command    => "/usr/bin/yum groupinstall -y kde-desktop",
        cwd        => "/",
        timeout    => "1800",
        unless     => "which startkde",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   

    include xscreensaver
}

