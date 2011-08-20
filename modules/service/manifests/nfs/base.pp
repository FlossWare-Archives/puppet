# This is the base class for all NFS modules.  It ensures
# nfslock is running.
#
# == Parameters
#
# == Variables
#
# [*packages*]
#   The base NFS packages for installation.
#
# == Examples
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class service::nfs::base {
    include service::portmap
    include service::rpc

    $packages = [
        "nfs-utils",
    ]

    util::enable_service_def {
        'nfslock':
            packages => $packages,
    }
}

