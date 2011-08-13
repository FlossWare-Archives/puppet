# Creates a mount directory and mounts it.
#
# == Parameters
#
# [*$device*]
#     The remote directory for mounting.
#
# [*$fstype*]
#     The type of mount.  By default is is nfs.
#
# [*$mountName*]
#     The local directory to create and use in mounting.
#
# [*$options*]
#     Options to use for mounting.  By default it is defaults.
#
# == Examples
#
#    util::mount_dir_def {
#        'my-remote-nfs-server':
#            device    => 'remoteserver:/home",
#            fstype    => 'nfs',
#            mountName => '/remotehome
#            options   => 'defaults',
#    }
#
#    util::mount_dir_def {
#        '/remotehome':
#            device => 'remoteserver:/home",
#            fstype => 'nfs',
#    }
#
# == Authors
#
#     Scot P. Floess <flossware@gmail.com>
#
define util::mount_dir_def ($device, $fstype, $mountName = $name, $options = 'defaults') {
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
            name     => $mountName,
            atboot   => true,
    }
}
