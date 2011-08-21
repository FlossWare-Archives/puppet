# Enables rpc service (rpcbind for Fedora and newer CentOS).
#
# == Parameters
#
# == Variables
#
# [*service*]
#   The service to start.  Based on operating system.
#
# == Examples
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class service::rpc {
    case $operatingsystem {
        CentOS: {
            case $operatingsystemrelease {
                6.0: {
                    $service = 'rpcbind'
                }
            }
        }

        Fedora: {
            $service = 'rpcbind'
        }
    }

    util::enable_service_def {
        'service::rpc::rpc':
            service => $service,
    }
}
