# This is the base class for NFS clients.  It ensures netfs is running.
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
class service::nfs::base_client inherits service::nfs::base {
    service {
        'netfs':
            ensure  => running,
            enable  => true,
    }
}
