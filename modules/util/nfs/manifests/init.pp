class services::nfs {
    $packages = [
        "nfs-utils",
    ]

    package { $packages:
        ensure => installed,
    }

    service { "nfslock":
        ensure  => running,
        enable  => true,
    }
}

