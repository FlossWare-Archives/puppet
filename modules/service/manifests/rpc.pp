class service::rpc {
    case $operatingsystem {
        Fedora: {
            util::enable_service_def {
                'rpcbind':
            }
        }
    }
}
