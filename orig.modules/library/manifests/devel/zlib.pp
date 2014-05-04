class library::zlib::development {
    $packages = [
        "zlib-devel",
    ]

    package { $packages:
        ensure => latest,
    }
}
