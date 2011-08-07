class nfs::base {
    $packages = [
        "nfs-utils",
    ]

    util::enable_service_def {
        'nfslock':
            packages => $packages,
    }
}

