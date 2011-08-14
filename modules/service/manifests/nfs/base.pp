class service::nfs::base {
    include service::portmap
    include service::rpc

    $packages = [
        "nfs-utils",
    ]

    util::enable_service_def {
        'nfslock':
            packages => $packages,
    }
}

