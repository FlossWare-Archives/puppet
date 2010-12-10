class xscreensaver {
    $packages = [
        "xscreensaver",
    ]

    package { $packages:
        ensure => latest,
    }
}
