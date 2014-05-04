class desktop::fvwm {
    include xfs
    include xwindows
    include xscreensaver

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
}