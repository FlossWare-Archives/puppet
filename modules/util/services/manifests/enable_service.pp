define services::enable_service ( $service, $packages = '' ) {
	packages::install_package ( $packages = $packages )

    service { $service:
        ensure  => running,
        enable  => true,
    }
}