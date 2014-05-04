class elinks {
    $packages = [
        "elinks",
    ]

    package { $packages:
        ensure => latest,
    }
}
