class service {
    $service_defaultBaseNetmask      = '255.255.255'
    $service_defaultNetmask          = "${service_defaultNetmask}.0"
    $service_defaultBaseIp           = '192.168.168'
    $service_defaultReverseBaseIp    = '168.168.192'
    $service_defaultSubnet           = "${service_defaultBaseIp}.0"
    $service_defaultBroadcastAddress = "${service_defaultBaseIp}.255"
    $service_defaultInternalDomain   = 'flossware.com'
    $service_defaultExternalDomain   = 'flossware.homelinux.org'
    $service_defaultAdminHost        = 'adminserver'
    $service_defaultAdminIp          = "${service_defaultBaseIp}.253"
    $service_defaultAdminFqdn        = "${service_defaultAdminHost}.${service_defaultInternalDomain}"
    $service_defaultGatewayIp        = "${service_defaultBaseIp}.1"

    $service_baseNetmask = $service_baseNetmask ? {
        ''      => $service_defaultBaseNetmask,
        default => $service_baseNetmask,
    }

    $service_netmask = $service_netmask ? {
        ''      => $service_defaultNetmask,
        default => $service_netmask,
    }

    $service_baseIp = $service_baseIp ? {
        ''      => $service_defaultBaseIp,
        default => $service_baseIp,
    }

    $service_reverseBaseIp = $service_reverseBaseIp ? {
        ''      => $service_defaultReverseBaseIp,
        default => $service_reverseBaseIp,
    }

    $service_subnet = $service_subnet ? {
        ''      => $service_defaultSubnet,
        default => $service_subnet,
    }

    $service_broadcastAddress = $service_broadcastAddress ? {
        ''      => $service_defaultBroadcastAddress,
        default => $service_broadcastAddress,
    }

    $service_internalDomain = $service_internalDomain ? {
        ''      => $service_defaultInternalDomain,
        default => $service_internalDomain,
    }

    $service_externalDomain = $service_externalDomain ? {
        ''      => $service_defaultExternalDomain,
        default => $service_externalDomain,
    }

    $serice_adminHost = $service_adminHost ? {
        ''      => $service_defaultAdminHost,
        default => $service_adminHost,
    }

    $service_adminIp = $sevice_adminIp ? {
        ''      => $service_defaultAdminIp,
        default => $service_adminIp,
    }

    $service_adminFqdn = $service_adminFqdn ? {
        ''      => $service_defaultAdminFqdn,
        default => $service_adminFqdn, 
    }

    $service_gatewayIp = $service_gatewayIp ? {
        ''      => $service_defaultGatewayIp,
        default => $service_gatewayIp, 
    }
}
