class service::nfs::base_client inherits service::nfs::base {
    util::enable_service_def {
        'netfs':
    }
}
