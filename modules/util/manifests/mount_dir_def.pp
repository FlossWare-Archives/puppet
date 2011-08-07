# Creates a mount directory and mounts it.
#
# == Parameters
#
# [*$device*]
#     The remote directory for mounting.
#
# [*$mountName*]
#     The local directory to create and use in mounting.
#
# [*$options*]
#     Options to use for mounting.  By default it is defaults.
#
# [*$fstype*]
#     The type of mount.  By default is is nfs.
#
# == Examples
#
#    util::mount_dir_def {
#        'my-remote-nfs-server':
#            device    => 'remoteserver:/home",
#            mountName => '/remotehome
#            options   => 'defaults',
#            fstype    => 'nfs',
#    }
#
#    util::mount_dir_def {
#        '/remotehome':
#            device => 'remoteserver:/home",
#    }
#
# == Authors
#
#     Scot P. Floess <flossware@gmail.com>
#
define util::mount_dir_def ($device, $mountName = $name, $options = 'defaults', $fstype = 'nfs') {
    file {
        $mountName:
            ensure => directory,
    }

    mount {
        $mountName:
            ensure   => mounted,
            device   => $device,
            fstype   => $fstype,
            remounts => true,
            options  => $options,
            name     => $mounName,
            atboot   => true,
    }
}
