class services::rpc {
    case $operatingsystem {
        Fedora: {
            service { "rpcbind":
                ensure  => running,
                enable  => true,
            }
        }
    }
}
