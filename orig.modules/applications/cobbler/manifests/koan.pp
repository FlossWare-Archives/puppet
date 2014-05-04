class applications::cobbler::koan {
    $packages = [
        "koan",
    ]

    package { $packages:
        ensure => latest,
    }
}
