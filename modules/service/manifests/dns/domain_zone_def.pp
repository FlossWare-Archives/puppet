define service::dns::domain_zone_def ( $server, $domain, $networkNumber, $ttl, $hostsMap, $zone = $name ) {
    file {
        "/etc/named/${zone}":
            content => template ( 'service/dns/named/domain.erb' ),
            owner   => 'named',
            group   => 'named',
            notify  => Service [ 'named' ],
    }
}
