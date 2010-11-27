class service {
    include defaults

    $service_defaultBaseIp           = template ( "service/BaseIp.erb" )
    $service_defaultRevereseBaseIp   = template ( "service/ReverseBaseIp.erb" )
    $service_defaultBroadcastAddress = "${service_defaultBaseIp}.255"
    
    $service_netmask = $service_netmask ? {
        ''      => $netmask_eth0,
        default => $service_netmask,
    }

    $service_subnet = $service_subnet ? {
        ''      => $network_eth0,
        default => $service_subnet,
    }

    $service_broadcastAddress = $service_broadcastAddress ? {
        ''      => $defaults::broadcastAddress,
        default => $service_broadcastAddress,
    }

    $service_internalDomain = $service_internalDomain ? {
        ''      => $domain,
        default => $service_internalDomain,
    }

    $service_externalDomain = $service_externalDomain ? {
        ''      => $defaults::externalDomain,
        default => $service_externalDomain,
    }

    $serice_adminHost = $service_adminHost ? {
        ''      => $defaults::adminHost,
        default => $service_adminHost,
    }

    $service_adminIp = $sevice_adminIp ? {
        ''      => $defaults::adminIp,
        default => $service_adminIp,
    }

    $service_adminFqdn = $service_adminFqdn ? {
        ''      => $defaults::adminFqdn,
        default => $service_adminFqdn, 
    }

    $service_gatewayIp = $service_gatewayIp ? {
        ''      => $defaults::gatewayIp,
        default => $service_gatewayIp, 
    }
}
