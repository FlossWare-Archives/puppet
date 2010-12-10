class meld {
    $packages = [
        "meld",
    ]

    package { $packages:
        ensure => latest,
    }
}

