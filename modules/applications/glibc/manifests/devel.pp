class glibc::devel inherit glibc {
    $packages = [
        "glibc-devel",
    ]

    package { $packages:
        ensure => latest,
    }
}