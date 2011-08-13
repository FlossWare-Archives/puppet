define service::nfs::mapped_client_def ( $clientMap = $name ) {
    service::nfs::client_def {
        $clientMap:
            device    => $clientMap [ 'device'    ],
            mountName => $clientMap [ 'mountName' ],
    }
}
