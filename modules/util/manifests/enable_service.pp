define util::enable_service ( $service, $packages = '' ) {
	util::install_package {
        $service:
            packages => $packages,
    }

    service {
        $service:
            ensure  => running,
            enable  => true,
    }
}
