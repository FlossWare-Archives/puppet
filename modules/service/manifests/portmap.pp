# Enables portmap service (portreserve for Fedora and newer CentOS).  Also
# ensures the correct package is installed.
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
class service::portmap {
    case $::operatingsystem {
        CentOS: {
            case $::lsbmajdistrelease {
                5: {
                    $serviceName = "portmap"
                    $packageName = "portmap"
                }

                default: {
                    $serviceName = "portreserve"
                    $packageName = "portreserve"
                }
            }
        }

        Fedora: {
            $serviceName = "portreserve"
            $packageName = "portreserve"
        }
    }

    util::enable_service_def {
        "service::portmap::${serviceName}":
            service  => $serviceName,
            packages => $packageName,
    }
}
