class desktop::fvwm {
    include xwindows

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

