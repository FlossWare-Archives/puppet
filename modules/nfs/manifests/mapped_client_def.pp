define nfs::mapped_client_def ( $clientMap = $name ) {
    nfs::client_def {
        $clientMap:
            device    => $clientMap [ 'device'    ],
            mountName => $clientMap [ 'mountName' ],
    }
}
