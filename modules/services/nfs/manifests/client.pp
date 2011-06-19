class services::nfs::client inherits nfs {
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

    service { "netfs":
        ensure  => running,
        enable  => true,
    }

    utils::nfs::mount_dir { $variables::nfs_serverDirs: }
}
