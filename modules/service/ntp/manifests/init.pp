class ntp inherits service {
    $ntp_defaultMinPoll = "4"
    $ntp_defaultMaxPoll = "8"

    $ntp_minPoll = $ntp_minPoll ? {
        ''      => $ntp_defaultMinPoll,
        default => $ntp_minPoll,
    }

    $ntp_maxPoll = $ntp_maxPoll ? {
        ''      => $ntp_defaultMaxPoll,
        default => $ntp_maxPoll,
    }

    $packages = [
        "ntp",
        "ntpdate",
    ]

    package { $packages:
        ensure => latest,
    }

    service { "ntpdate":
        enable  => true,
    }

    service { "ntpd":
        ensure  => running,
        enable  => true,
    }
}

class ntp::client inherits ntp {
    $ntp_defaultServer = "${service_adminIp}"

    $ntp_server = $ntp_server ? {
        ''      => $ntp_defaultServer,
        default => $ntp_server,
    }

    file { "/etc/ntp.conf":
        content => template ( "ntp/client/ntp.conf" ),
        notify  => Service [ "ntpd" ]
    }

}

class ntp::server inherits ntp {
    $ntp_defaultBroadcast = "${service_defaultBroadcastAddress}"
    $ntp_defaultServer    = "0.north-america.pool.ntp.org"

    $ntp_broadcast = $ntp_broadcast ? {
        ''      => $ntp_defaultBroadcast,
        default => $ntp_broadcast,
    }

    $ntp_server = $ntp_server ? {
        ''      => $ntp_defaultServer,
        default => $ntp_server,
    }

    file { "/etc/ntp.conf":
        content => template ( "ntp/server/ntp.conf" ),
        notify  => Service [ "ntpd" ]
    }
}
