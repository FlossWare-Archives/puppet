class gnu::gcc {
    $packages = [
        "gcc",
        "gcc-c++",
        "autoconf",
        "automake",
    ]

    package { $packages:
        ensure => latest,
    }
}

class gnu::zlib {
    $packages = [
        "zlib-devel",
    ]

    package { $packages:
        ensure => latest,
    }
}

class gnu {
    include gnu::gcc
    include gnu::zlib
}
