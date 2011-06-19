class library::autoconf {
    $packages = [
        "autoconf",
    ]

    package { $packages:
        ensure => latest,
    }
}
