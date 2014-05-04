class library::zlib {
    $packages = [
        "zlib",
    ]

    package { $packages:
        ensure => latest,
    }
}
