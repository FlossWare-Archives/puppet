class gtk {
    $packages = [
        "gtk",
    ]

    package { $packages:
        ensure => latest,
    }
}

class gtk::development inherits gtk {
    $packages = [
        "gtk+-devel",
    ]

    package { $packages:
        ensure => latest,
    }
}
