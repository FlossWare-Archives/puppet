define service::dns::server_def ( $serverMap ) {
    util::enable_service_def {
        "service::dns::mapped_server_def::${name}::named":
            packages => 'bind',
            service  => 'named',
    }

    file {
        "service::dns::mapped_server_def::${name}::/etc/named.conf":
            content => template ( 'service/dns/named.conf.erb' ),
            owner   => 'named',
            group   => 'named',
            path    => '/etc/named.conf',
            notify  => Service [ 'named' ], 
    }

    file {
        "service::dns::mapped_server_def::${name}::/etc/named":
            ensure => directory,
            owner  => 'named',
            group  => 'named',
            path   => '/etc/named',
    }

    service::dns::zone_def {
        "service::dns::mapped_server_def::${name}::zones":
            server      => $server,
            domainZone  => $domainZone,
            networkZone => $networkZone,
            ttl         => $ttl,
            hostsMap    => $hostsMap,
    }
}
