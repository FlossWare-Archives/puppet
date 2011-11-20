define service::dns::zone_def ( $server, $domainZone, $networkZone, $ttl, $hostsMap ) {
    file {
        "/etc/named/${networkZone}":
            content => template ( 'service/dns/named/network.in-addr.arpa.erb' ),
            owner   => 'named',
            group   => 'named',
            notify  => Service [ 'named' ],
    }

    file {
        "/etc/named/${domainZone}":
            content => template ( 'service/dns/named/domain.erb' ),
            owner   => 'named',
            group   => 'named',
            notify  => Service [ 'named' ],
    }
}
