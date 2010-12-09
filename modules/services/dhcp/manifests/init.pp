class dhcp inherits service {
    include dns

    # --------------------------------------------------------
    # Define default values...
    # --------------------------------------------------------

    $dhcp_defaultIdentifier = $defaults::dhcp_defaultIdentifier ? { 
        ''      => ${service_masterHost},
        default => $defaults::dhcp_defaultIdentifier,
    }

    $dhcp_defaultDomainName = $defaults::dhcp_defaultDomainName ? {
        ''      => ${service_internalDomain},
        default => $defaults::dhcp_defaultDomainName,
    }

    $dhcp_defaultMaxLeaseTime = $defaults::dhcp_defaultMaxLeaseTime ? {
        ''      => '21600',
        default => $defaults::dhcp_defaultMaxLeaseTime,
    }

    $dhcp_defaultDefaultLeaseTime = $defaults::dhcp_defaultDefaultLeaseTime ? {
        ''      => '21600',
        default => $defaults::dhcp_defaultDefaultLeaseTime,
    }

    $dhcp_defaultMinIp = $defaults::dhcp_defaultMinIp ? {
        ''      => '50',
        default => $defaults::dhcp_defaultDefaultLeaseTime,
    }

    $dhcp_defaultSubnets = $defaults::dhcp_defaultSubnets ? {
        '' => [
            {
                subnet           => "${service_subnet}",
                netmask          => "${service_netmask}",
                minIp            => "${service_baseIp}.50",
                maxIp            => "${service_baseIp}.250",
                subnetMask       => "${service_netmask}",
                broadcastAddress => "${service_broadcastAddress}",
                routers          => "${service_gatewayIp}",
                dnsServers       => "${dns::dns_serverIp}",
                domainName       => "${service_internalDomain}",
            }
        ],
        default => $defaults::dhcp_defaultSubnets,
    }

    $dhcp_defaultZones = $defaults::dhcp_defaultZones ? {
        ''      => ${dns::zones},
        default => $defaults::dhcp_defaultZones,
    }

    # --------------------------------------------------------
    # Define default values...
    # --------------------------------------------------------

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
