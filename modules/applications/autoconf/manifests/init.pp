class autoconf {
    $packages = [
        "autoconf",
    ]

    package { $packages:
        ensure => latest,
    }
}
