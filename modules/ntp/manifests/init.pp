include common::variables

class variables ( $defaultMinPoll = "4", $defaultMaxPoll = "8", $defaultServer, $defaultBroadcast = "" ) inherits common::variables {
    $ntp_minPoll = $ntp_minPoll ? {
        ''      => $defaultMinPoll,
        default => $ntp_minPoll,
    }

    $ntp_maxPoll = $ntp_maxPoll ? {
        ''      => $defaultMaxPoll,
        default => $ntp_maxPoll,
    }

    $ntp_server = $ntp_server ? {
        ''      => $defaultServer,
        default => $ntp_server,
    }

    $ntp_broadcast = $ntp_broadcast ? {
        ''      => $defaultBroadcast,
        default => $ntp_broadcast,
    }
}

class ntp {
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

    file { "/etc/ntp.conf":
        content => template ( "ntp/client/ntp.conf" ),
        notify  => Service [ "ntpd" ]
    }
}

class ntp::client::variables {
    class {
        variables:
            defaultServer => "${common::common_masterIp}",
    }

    $ntp_minPoll   = $variables::ntp_minPoll
    $ntp_maxPoll   = $variables::ntp_maxPoll
    $ntp_server    = $variables::ntp_server
    $ntp_broadcast = $variables::ntp_broadcast
}

class ntp::client inherits ntp::client::variables {
    include ntp
}

class ntp::server::variables {
    class {
        variables:
            defaultBroadcast => "${common::common_broadcastAddress}",
            defaultServer    => "0.north-america.pool.ntp.org",
    }

    $ntp_minPoll   = $variables::ntp_minPoll
    $ntp_maxPoll   = $variables::ntp_maxPoll
    $ntp_server    = $variables::ntp_server
    $ntp_broadcast = $variables::ntp_broadcast
}

class ntp::server inherits ntp::server::variables {
    include ntp
}
