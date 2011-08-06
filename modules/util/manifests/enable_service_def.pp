define util::enable_service_def ($service, $packages = undef) {
	util::install_package_def {
        $service:
            packages => $packages,
    }

    service {
        $service:
            ensure  => running,
            enable  => true,
    }
}
