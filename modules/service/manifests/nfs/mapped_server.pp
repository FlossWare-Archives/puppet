# This class represents an NFS server, exporting multiple directories.
#
# == Parameters
#
# [*exportMap*]
#   A hash that should contain the following keys:  
#     dir         = the directory to export.
#     domain      = who is allowed to share dir.  For example *.foo.com
#     permissions = when exporting dir, the permissions on the share.  For example, rw,no_root_squash
#
# == Variables
#
# == Examples
#
# $home = {
#     dir         => '/home',
#     domain      => '*.foo.com',
#     permissions => 'rw,no_root_squash',
# }
#
# $shared = {
#     dir         => '/shared',
#     domain      => '*.foo.com',
#     permissions => 'rw,no_root_squash',
# }
#
# $exports = {
#     $home,
#     $shared,
# }
#
# class {
#     'service::nfs::mapped_server':
#         exportMap => $exports,
# }
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class service::nfs::mapped_server ( $exportMap ) inherits service::nfs:base {
    service {
        'nfs':
            ensure  => running,
            enable  => true,
    }

    file {
        '/etc/exports':
            content => template ( 'service/nfs/exports.erb' ),
            notify  => Service [ 'nfs' ],
    }
}
