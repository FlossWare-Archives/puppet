class zlib {
    $packages = [
        "zlib",
    ]

    package { $packages:
        ensure => latest,
    }
}

class zlib::development inherits zlib {
    $packages = [
        "zlib-devel",
    ]

    package { $packages:
        ensure => latest,
    }
}
