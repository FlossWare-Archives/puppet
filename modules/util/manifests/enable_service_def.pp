# This will enable a service and ensure packages are installed for the service.
#
# == Parameters
#
# [*$service*]
#     The name of the service to enable.
#
# [*$packages*]
#     A set of packages to install for the service.
#
# == Examples
#
#    util::enable_service_def {
#        'nisclient':
#            service  => 'ypbind',
#            packages => [ 'yp-tools', 'ypbind' ],
#    }
#
# == Authors
#
#     Scot P. Floess <flossware@gmail.com>
#
define util::enable_service_def ( $service, $packages ) {
    package {
        $packages:
            ensure => installed,
    }

    service {
        $service:
            ensure  => running,
            enable  => true,
    }
}
