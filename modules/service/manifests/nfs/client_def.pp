# Will perform an NFS client mount.
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
# == Examples
#
# service::nfs::client_def {
#     'remotehome':
#         device    => 'remoteserver:/home',
#         mountName => '/home',
# }
#
# service::nfs::client_def {
#     '/home':
#         device => 'remoteserver:/home',
# }
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
define service::nfs::client_def ($device, $mountName = $name) {
    util::mount_dir_def {
        $mountName:
            device    => $device,
            fstype    => 'nfs',
            mountName => $mountName,
    }
}
