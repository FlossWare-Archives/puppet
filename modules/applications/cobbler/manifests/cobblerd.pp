class cobbler::server {
    $packages = [
        "yum-utils",
        "cobbler",
        "cobbler-web",
    ]

    package { "${packages}":
        ensure => latest,
    }

    service { 'cobblerd':
        ensure  => running,
        enable  => true,
    }

    include apache::httpd
}