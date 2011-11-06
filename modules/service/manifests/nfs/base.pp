# This is the base class for all NFS modules.  It ensures
# nfslock is running.
#
# == Parameters
#
# == Variables
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

    util::enable_service_def {
        "${name}::nfslock":
            service  => 'nfslock',
            packages => 'nfs-utils',
    }
}

