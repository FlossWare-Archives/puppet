class gcc {
    $packages = [
        "automake",
    ]

    package { $packages:
        ensure => latest,
    }
}
