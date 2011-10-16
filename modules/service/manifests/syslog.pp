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
            case $::lsbmajdistrelease {
                5: {
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

    service {
        $service:
            ensure  => running,
            enable  => true,
    }
}
