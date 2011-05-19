class nfs {
    $packages = [
        "nfs-utils",
    ]

    package { $packages:
        ensure => installed,
    }

    service { "nfslock":
        ensure  => running,
        enable  => true,
    }
}

class nfs::client inherits nfs {
    class variables inherits common::variables {
        $nfs_defaultServer     = "${common_masterHost}"
        $nfs_defaultServerDirs = [ "/home", ]

        $nfs_server = $nfs_server ? {
            ''      => $nfs_defaultServer,
            default => $nfs_server,
        }

        $nfs_serverDirs = $nfs_serverDirs ? {
            ''      => $nfs_defaultServerDirs,
            default => $nfs_serverDirs,
        }
    }

    define mountDirs() {
        file { "${name}":
            ensure => directory,
        }

        mount { "${name}":
            ensure   => mounted,
            device   => "${variables::nfs_server}:${name}",
            fstype   => "nfs",
            remounts => true,
            options  => "defaults",
            name     => "${name}",
            atboot   => true,
        }
    }

    service { "netfs":
        ensure  => running,
        enable  => true,
    }

    mountDirs { $variables::nfs_serverDirs: }
}

class nfs::server inherits nfs {
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
