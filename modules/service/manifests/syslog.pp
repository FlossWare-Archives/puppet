# Enables syslog service (rsyslog for Fedora and newer CentOS).
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
class service::syslog {
    case $::operatingsystem {
        CentOS: {
            case $::operatingsystemrelease {
                5.6: {
                    $service = "syslog"
                }

                default: {
                    $service = "rsyslog"
                }
            }
        }

        Fedora: {
            $service = "rsyslog"
        }

        default: {
            fail ( "Nothing to handle OS [${::operatingsystem}]" )
        }
    }

    util::enable_service_def {
        "service::syslog::${service}":
            service => $service,
    }
}
