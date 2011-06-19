define util::nfs::mount_dir ($device, $mountName = $name, $options = 'defaults', $fstype='nfs') {
    file { $mountNname:
        ensure => directory,
    }

    mount { $mountName:
        ensure   => mounted,
        device   => $device,
        fstype   => $fstype,
        remounts => true,
        options  => $options,
        name     => $mounName,
        atboot   => true,
    }
}
