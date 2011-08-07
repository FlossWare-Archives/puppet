class nfs::mapped_client ($device, $mountName = $name) inherits nfs::base {
    service {i
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
