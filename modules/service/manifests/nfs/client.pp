# Will NFS mount one remote directory.  If multiple directories need to be mounted,
# use service::nfs::mapped_client.
#
# == Parameters
#
# [*device*]
#   The remote server and dir to mount.  For example, remoteserver:/home
#
# [*mountName*]
#   The local directory where the mount will occur.
#
# == Variables
#
# [*clientMap*]
#   A hash of the device and mountName.  This hash is then used by
#   service::nfs::mapped_client to do the actual mounting.
#
# == Examples
#
# class {
#     'service::nfs::client':
#         device    => 'remoteserver:/home',
#         mountName => '/home',
# }
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class service::nfs::client ($device, $mountName) inherits service::nfs::base_client {
    $clientMap = {
        device    => $device,
        mountName => $mountName,
    }

    class {
        'service::nfs::mapped_client':
            clientMap => $clientMap,
    }
}
