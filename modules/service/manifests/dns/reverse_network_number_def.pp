define service::dns::reverse_network_number_def ( $server, $domain, $reverseNetworkNumber, $ttl, $hostsMap, $zone = $name ) {
    file {
        "/etc/named/${zone}":
            content => template ( 'service/dns/named/reverse_network_number.in-addr.arpa.erb' ),
            owner   => 'named',
            group   => 'named',
            notify  => Service [ 'named' ],
    }
}
