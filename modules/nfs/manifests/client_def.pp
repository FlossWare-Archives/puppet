define nfs::client_def ($device, $mountName = $name) {
    service {
        'netfs':
            ensure  => running,
            enable  => true,
    }

    utils::mount_dir_def {
        $mountName:
            device    => $device,
            mountName => $mountName,
    }
}
