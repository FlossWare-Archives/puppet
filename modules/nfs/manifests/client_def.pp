define nfs::client_def ($device, $mountName = $name) {
    util::mount_dir_def {
        $mountName:
            device    => $device,
            fstype    => 'nfs',
            mountName => $mountName,
    }
}
