# This class will NFS mount from values found in the clientMap hash.
#
# == Parameters
#
# [*clientMap*]
#   A hash containing NFS client mapping information:
#     device    = the remote server and dir to mount.  For example, remoteserver:/home .
#     mountName = the local directory where the mount will occur.
#
# == Variables
#
# == Examples
#
# A single hash to mount a directory:
#
# $mapping = {
#     device    => 'remoteserver:/home',
#     mountName => '/home',
#
# class {
#     'service::nfs::mapped_client':
#         clientMap => $mapping,
# }
#
# Mounting multiple directories:
#
# $mapping1 = {
#     device    => 'remoteserver:/home',
#     mountName => '/home',
#
# $mapping2 = {
#     device    => 'remoteserver:/shared',
#     mountName => '/shared',
#
# $mapping = {
#     $mapping1,
#     $mapping2,
# }
#
# class {
#     'service::nfs::mapped_client':
#         clientMap => $mapping,
# }
class service::nfs::mapped_client ( $clientMap ) inherits service::nfs::base_client {
    service::nfs::mapped_client_def {
        "service::nfs::mapped_client::${clientMap}":
            clientMap => $clientMap,
    }
}
