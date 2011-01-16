class desktop::fvwm {
    include xwindows

    $packages = [ 
        "fvwm",
        "fvwm-themes",
        "fvwm-themes-extra",
        "perl-Tk",
        "perl-X11-Protocol"
    ]   

    package { $packages:
        ensure => latest,
    }   

    include xfs
    include xscreensaver
}

