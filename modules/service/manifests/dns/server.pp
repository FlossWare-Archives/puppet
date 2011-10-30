class services::dns::server ( $listenOn, $forwarders, $zones, $parentServer, $reverseSubIp, $server = $::fqdn, $domain = ::$domain, $ttl = '86400' ) {
    $packages = [
        "bind",
    ]

    package { $packages:
        ensure => installed,
    }

    service { "named":
        ensure  => running,
        enable  => true,
    }

    service::dns::domain_zone_def {
        $zones:
    }

    service::dns::reverse_network_number_def {
        $zones:
    }
}
