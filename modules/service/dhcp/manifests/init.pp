class dhcp inherits service {
    include dns

    $dhcp_defaultIdentifier       = ${service_adminHost}
    $dhcp_defaultDomainName       = ${service_internalDomain}
    $dhcp_defaultMaxLeaseTime     = '21600'
    $dhcp_defaultDefaultLeaseTime = '21600'
    $dhcp_defaultSubnet           = ${service_subnet}
    $dhcp_defaultNetmask          = ${service_netmask}
    $dhcp_defaultMinIp            = "${service_defaultBaseIp}.50"
    $dhcp_defaultMaxIp            = "${service_defaultBaseIp}.250"
    $dhcp_defaultSubnetMask       = ${service_netmask}
    $dhcp_defaultBraodcastAddress = ${service_broadcastAddress}
    $dhcp_defaultRouters          = ${service_gatewayIp}
    $dhcp_defaultDnsServers       = ${dns::dns_serverIp}
    $dhcp_zones                   = ${dns::zones}


    $dhcp_identifier = $dhcp_identifier ? { 
        ''      => $dhcp_defaultIdentifier,
        default => $dhcp_identifier,
	}   

    $dhcp_domainName = $dhcp_domainName ? { 
        ''      => $dhcp_defaultDomainName,
        default => $dhcp_domainName,
	}   

    $dhcp_maxLeaseTime = $dhcp_maxLeaseTime ? { 
        ''      => $dhcp_defaultMaxLeaseTime,
        default => $dhcp_maxLeaseTime,
	}   

    $dhcp_defaultLeaseTime = $dhcp_defaultLeaseTime ? { 
        ''      => $dhcp_defaultDefaultLeaseTime,
        default => $dhcp_defaultLeaseTime,
	}   

    $dhcp_subnet = $dhcp_subnet ? { 
        ''      => $dhcp_defaultSubnet,
        default => $dhcp_subnet,
	}   

    $dhcp_netmask = $dhcp_netmask ? { 
        ''      => $dhcp_defaultNetmask,
        default => $dhcp_netmask,
	}   

    $dhcp_minIp = $dhcp_minIp ? { 
        ''      => $dhcp_defaultMinIp,
        default => $dhcp_minIp,
	}   

    $dhcp_maxIp = $dhcp_maxIp ? { 
        ''      => $dhcp_defaultMaxIp,
        default => $dhcp_maxIp,
	}   

    $dhcp_subnetMask = $dhcp_subnetMask ? { 
        ''      => $dhcp_defaultSubnetMask,
        default => $dhcp_subnetMask,
	}   

    $dhcp_broadcastAddress = $dhcp_broadcastAddress ? { 
        ''      => $dhcp_defaultBroadcastAddress,
        default => $dhcp_broadcastAddress,
	}   

    $dhcp_routers = $dhcp_routers ? { 
        ''      => $dhcp_defaultRouters,
        default => $dhcp_routers,
	}   

    $dhcp_dnsServers = $dhcp_dnsServers ? { 
        ''      => $dhcp_defaultDnsServers,
        default => $dhcp_dnsServers,
	}   

    $dhcp_zones = $dhcp_zones ? { 
        ''      => $dhcp_defaultZones,
        default => $dhcp_zones,
	}   
}

class dhcp::server inherits dhcp {
    $packages = [
        "dhcp",
    ]

    package { $packages:
        ensure => installed,
    }

    service { "dhcpd":
        ensure  => running,
        enable  => true,
    }

    $configFile = $operatingsystem ? {
        'CentOS' => "/etc/dhcpd.conf",
        'Fedora' => "/etc/dhcp/dhcpd.conf",
    }

    file { "${configFile}":
        content => template ( "dhcp/dhcpd.erb" ),
        notify  => Service  [ "dhcpd" ],
    }
}
