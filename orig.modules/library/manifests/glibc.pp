class library::glibc {
    $packages = [
        "glibc",
    ]

    package { $packages:
        ensure => latest,
    }
}
