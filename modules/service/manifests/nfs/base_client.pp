class service::nfs::base_client inherits service::nfs::base {
    include service::portmap

    util::enable_service_def {
        'netfs':
    }
}
