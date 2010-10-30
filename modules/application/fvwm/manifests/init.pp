class desktop::fvwm {
    exec { "FVWM Dependencies":
        command    => "/usr/bin/yum groupinstall -y base-x ; /usr/bin/yum install -y fvwm xorg-x11-fonts*",
        cwd        => "/",
        timeout    => "1800",
        unless     => "which fvwm",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   

    $packages = [ 
        "fvwm",
        "perl-Tk",
        "perl-X11-Protocol"
    ]   

    package { $packages:
        ensure => latest,
    }   

    include xfs
    include xscreensaver
}

