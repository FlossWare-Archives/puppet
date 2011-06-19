class library::gtk {
    $packages = [
        "gtk",
    ]

    package { $packages:
        ensure => latest,
    }
}
