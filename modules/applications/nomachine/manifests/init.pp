class nomachine::client {
    $packages = [
        "nxclient",
    ]

    package { $packages:
        ensure => latest,
    }
}

