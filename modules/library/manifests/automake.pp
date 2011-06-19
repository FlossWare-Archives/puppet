class library::automake {
    $packages = [
        "automake",
    ]

    package { $packages:
        ensure => latest,
    }
}
