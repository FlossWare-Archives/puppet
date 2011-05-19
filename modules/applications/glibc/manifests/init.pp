class glibc {
    $packages = [
        "glibc",
    ]

    package { $packages:
        ensure => latest,
    }
}

class glibc::devel inherit glibc {
    $packages = [
        "glibc-devel",
    ]

    package { $packages:
        ensure => latest,
    }
}
