class cobbler::koan {
    $packages = [
        "koan",
    ]

    package { "${packages}":
        ensure => latest,
    }
}