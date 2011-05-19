class cobbler::koan {
    $packages = [
        "koan",
    ]

    package { $packages:
        ensure => latest,
    }
}

class cobbler::server {
    include cobbler::koan

    $packages = [
        "yum-utils",
        "cobbler",
        "cobbler-web",
    ]

    package { $packages:
        ensure => latest,
    }

    service { "cobblerd":
        ensure  => running,
        enable  => true,
    }

    include httpd
}
