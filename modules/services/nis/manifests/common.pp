class services::nis::common {
    $packages = [
        "yp-tools",
    ]

    package { $packages:
        ensure => latest,
    }

    service { "yppasswdd":
        ensure  => running,
        enable  => true,
    }
}
