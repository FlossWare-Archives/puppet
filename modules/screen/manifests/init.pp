class screen {
    $packages = [
        "screen",
    ]

    package { $packages:
        ensure => latest,
    }
}
