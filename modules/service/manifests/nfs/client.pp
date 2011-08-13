class service::nfs::client ($device, $mountName = $name) inherits service::nfs::base_client {
    service::nfs::client_def {
        $mountName:
            device    => $device,
            mountName => $mountName,
    }
}
