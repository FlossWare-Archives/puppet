class services::enable_service {
    $packages = [
        "httpd",
    ]

	packages::install_package ( $packages = $packages )

    service { "httpd":
        ensure  => running,
        enable  => true,
    }
}