class rpm {
    $packages = [
        "rpm-build",
        "rpmlint",
    ]

    package { $packages:
        ensure => latest,
    }
}

