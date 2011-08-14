class service::nfs::client ($device, $mountName = $name) inherits service::nfs::base_client {
    $clientMap = {
        device    => $device,
        mountName => $mountName,
    }

    class {
        'service::nfs::mapped_client':
            clientMap => $clientMap,
    }
}
