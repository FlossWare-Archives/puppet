class wol {
    $packages = [
        "wol",
    ]

    package { $packages:
        ensure => latest,
    }
}

