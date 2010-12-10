class httpd::server {
    $packages = [
        "httpd",
    ]

    package { $packages:
        ensure => installed,
    }

    service { "httpd":
        ensure  => running,
        enable  => true,
    }
}
