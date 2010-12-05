class rpm {
    $packages = [
        "rpm-build",
    ]

    package { $packages:
        ensure => latest,
    }

    include gnu
}

