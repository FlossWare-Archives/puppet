class library::libXaw {
    $packages = [
        "libXaw",
    ]

    package { $packages:
        ensure => latest,
    }
}
