# Will NFS mount for a client.
#
# == Parameters
#
# [*clientMap*]
#   A hash containing client information for NFS mounting:
#     device    = the remote server and dir to mount.  For example, remoteserver:/home
#     mountName = the local directory where the mount will occur.
#
# == Examples
#
# Mounting a single directory:
#
# $mapping1 = {
#     device    => 'remoteserver:/home',
#     mountName => '/home',
# }
#
# service::nfs::mapped_client_def {
#     'mymount':
#         clientMap => $mapping1,
# }
#
# $mapping2 = {
#     device    => 'remoteserver:/shared',
#     mountName => '/shared',
# }
#
# service::nfs::mapped_client_def {
#     $mapping2:
# }
#
# Mounting multiple directories:
#
# $mapping1 = {
#     device    => 'remoteserver:/home',
#     mountName => '/home',
# }
#
# $mapping2 = {
#     device    => 'remoteserver:/shared',
#     mountName => '/shared',
# }
#
# $mapping = {
#     $mapping1,
#     $mapping2,
# }
#
# service::nfs::mapped_client_def {
#     'multi_map':
#         clientMap => $mapping,
# }
#
define service::nfs::mapped_client_def ( $clientMap = $name ) {
    service::nfs::client_def {
        "service::nfs::mapped_client_def::${clientMap}":
            device    => $clientMap [ 'device'    ],
            mountName => $clientMap [ 'mountName' ],
    }
}
