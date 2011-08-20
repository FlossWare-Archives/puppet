# This class represents an NFS server, exporting one directory.  If you
# want to export more than one directory, please use service::nfs::mapped_server.
#
# == Parameters
#
# [*dir*]
#   The directory to export.
#
# [*domain*]
#   Who is allowed to share dir.  For example *.foo.com
#
# [*permissions*]
#   When exporting dir, the permissions on the share.  For example, rw,no_root_squash
#
# == Variables
#
# [*exportMap*]
#   Builds a hash containing dir, domain and permissions.  This variable is then
#   used and passed to service::nfs::mapped_server
#
# == Examples
#
# class {
#    'service::nfs::server':
#      dir         => '/home', 
#      domain      => '*.foo.com',
#      permissions => 'rw,no_root_squash',
# }
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class service::nfs::server ( $dir, $domain, $permissions ) inherits service::nfs:base {
    $exportMap = {
        dir         => $dir,
        domain      => $domain,
        permissions => $permissions,
    }

    class {
        'service::nfs::mapped_server':
            exportMap => $exportMap,
    }
}
