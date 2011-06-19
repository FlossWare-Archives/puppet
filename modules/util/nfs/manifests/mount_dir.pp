define util::mount_dir() {
    file { $name:
        ensure => directory,
    }

    mount { $name:
        ensure   => mounted,
        device   => "${variables::nfs_server}:${name}",
        fstype   => "nfs",
        remounts => true,
        options  => "defaults",
        name     => "${name}",
        atboot   => true,
    }
}
