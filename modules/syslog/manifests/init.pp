class syslog {
    case $operatingsystem {
        CentOS: {
            service { "syslog":
                ensure  => running,
                enable  => true,
            }
        }

        Fedora: {
            service { "rsyslog":
                ensure  => running,
                enable  => true,
            }
        }
    }
}
