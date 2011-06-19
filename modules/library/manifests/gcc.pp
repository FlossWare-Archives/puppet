class library::gcc {
    include auotmake
    include auotconf

    $packages = [
        "gcc",
        "gcc-c++",
    ]

    package { $packages:
        ensure => latest,
    }
}
