class service::rpc {
    case $operatingsystem {
        Fedora: {
            $service = 'rpcbind'
        }
    }

    util::enable_service_def {
        $service:
    }
}
