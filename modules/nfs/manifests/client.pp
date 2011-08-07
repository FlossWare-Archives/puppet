class nfs::client ($device, $mountName = $name) inherits nfs::base {
    nfs::client_def {
        $mountName:
            device    => $device,
            mountName => $mountName,
    }
}
