class services::cobbler::server {
    $packages = [
        "yum-utils",
        "cobbler",
        "cobbler-web",
    ]

    package { $packages:
        ensure => latest,
    }

    service { 'cobblerd':
        ensure  => running,
        enable  => true,
    }

    include services::apache::httpd
}
