class wine {
    $packages = [
        "wine",
    ]

    package { $packages:
        ensure => latest,
    }
}
