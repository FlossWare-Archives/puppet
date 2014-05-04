include common

class gnome ($timeout = "${common::execTimeout}" {
    include xwindows
    include xscreensaver

    exec { "Gnome Dependencies":
        command    => "/usr/bin/yum groupinstall -y gnome-desktop",
        cwd        => "/",
        timeout    => "${timeout}",
        unless     => "which gnome-session",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   
}