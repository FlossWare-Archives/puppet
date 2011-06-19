class services::ntp::client::variables {
    class {
        variables:
            defaultServer => "${common::common_masterIp}",
    }

    $ntp_minPoll   = $variables::ntp_minPoll
    $ntp_maxPoll   = $variables::ntp_maxPoll
    $ntp_server    = $variables::ntp_server
    $ntp_broadcast = $variables::ntp_broadcast
}

class services::ntp::client inherits services::ntp::client::variables {
    include services::ntp::common
}
