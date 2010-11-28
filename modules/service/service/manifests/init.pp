class service {
    include defaults
    
    $service_netmask = $service_netmask ? {
        ''      => $netmask_eth0,
        default => $service_netmask,
    }

    $service_subnet = $service_subnet ? {
        ''      => $network_eth0,
        default => $service_subnet,
    }

    $service_baseIp = $service_baseIp ? {
        ''      => template ( "service/BaseIp.erb" ),
        default => $service_baseIp,
    }

    $service_reverseBaseIp = $service_reverseBaseIp ? {
        ''      => template ( "service/ReverseBaseIp.erb" ),
        default => $service_reverseBaseIp,
    }

    $service_broadcastAddress = $service_broadcastAddress ? {
        ''      => "{service_defaultBaseIp}.255",
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
