class services::syslog {
    case $::operatingsystem {
        CentOS: {
            $service = "syslog"
        }

        Fedora: {
            $service = "rsyslog"
        }

        default: {
            fail ( "Nothing to handle OS [${::operatingsystem}]" )
        }
    }

    service { $service:
        ensure  => running,
        enable  => true,
    }
}
