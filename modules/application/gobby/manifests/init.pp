class gobby {
    $packages = [
        "gobby",
    ]

    package { $packages:
        ensure => latest,
    }
}

