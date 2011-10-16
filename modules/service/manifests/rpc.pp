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
    case $::operatingsystem {
        CentOS: {
            case $::lsbmajdistrelease {
                6: {
                    service {
                        'rpcbind':
                            ensure  => running,
                            enable  => true,
                    }
                }
            }
        }

        Fedora: {
            service {
                'rpcbind':
                    ensure  => running,
                    enable  => true,
            }
        }
    }
}
