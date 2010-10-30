class fetchmail {
    $packages = [
        "fetchmail",
    ]

    package { $packages:
        ensure => latest,
    }
}
