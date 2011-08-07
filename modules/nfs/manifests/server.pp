class services::nfs::server inherits services::nfs {
    class variables inherits common::varialbles {
        $nfs_defaultExports     = [ "/home", ]
        $nfs_defaultPermissions = "rw,no_root_squash" 

        $nfs_exports = $nfs_exports ? {
            ''      => $nfs_defaultExports,
            default => $nfs_exports,
        }

        $nfs_permissions = $nfs_permissions ? {
            ''      => $nfs_defaultPermissions,
            default => $nfs_permissions,
        }
    }

    service { "nfs":
        ensure  => running,
        enable  => true,
    }

    file { "/etc/exports":
        content => template ( "nfs/exports.erb" ),
        notify  => Service [ "nfs" ],
    }
}
