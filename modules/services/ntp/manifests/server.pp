class services::ntp::server::variables {
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

class services::ntp::server inherits services::ntp::server::variables {
    include services::ntp::common
}
