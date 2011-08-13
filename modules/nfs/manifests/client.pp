class nfs::client ($device, $mountName = $name) inherits nfs::base_client {
    nfs::client_def {
        $mountName:
            device    => $device,
            mountName => $mountName,
    }
}
