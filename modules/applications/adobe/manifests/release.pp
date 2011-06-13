class adobe::release {
    $packages = [
        "adobe-release-$architecture",
    ]

    package { $packages:
        ensure  => latest,
    }
}