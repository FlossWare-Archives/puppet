class services::syslog {
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
        $service:
    }
}
