class service {
    include defaults

    $service_baseNetmask = $service_baseNetmask ? {
        ''      => $defaults::baseNetmask,
        default => $service_baseNetmask,
    }

    $service_netmask = $service_netmask ? {
        ''      => $defaults::netmask,
        default => $service_netmask,
    }

    $service_baseIp = $service_baseIp ? {
        ''      => $defaults::baseIp,
        default => $service_baseIp,
    }

    $service_reverseBaseIp = $service_reverseBaseIp ? {
        ''      => $defaults::reverseBaseIp,
        default => $service_reverseBaseIp,
    }

    $service_subnet = $service_subnet ? {
        ''      => $defaults::subnet,
        default => $service_subnet,
    }

    $service_broadcastAddress = $service_broadcastAddress ? {
        ''      => $defaults::broadcastAddress,
        default => $service_broadcastAddress,
    }

    $service_internalDomain = $service_internalDomain ? {
        ''      => $defaults::internalDomain,
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
