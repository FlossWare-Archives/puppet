class library::libX11 {
    $packages = [
        "libX11",
    ]

    package { $packages:
        ensure => latest,
    }
}
