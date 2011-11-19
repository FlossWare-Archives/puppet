define service::dns::server_def ( $listenOn, $forwarders, $domainZone, $networkZone, $zoneType, $hostsMap, $allowUpdate, $ttl, $notifyChange, $networkNumber, $reverseNetworkNumber, $server, $domain) {
    $serverMap = {
        $zones => [ $domainZone, "${networkZone}.in-addr.arpa" ],
    }

    service::dns::mapped_server_def {
        "service::dns::server_def::${name}":
            serverMap => $serverMap,
    }
}
