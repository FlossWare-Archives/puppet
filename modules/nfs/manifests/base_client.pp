class nfs::base_client inherits nfs::base {
    include service::portmap

    util::enable_service_def {
        'netfs':
    }
}
