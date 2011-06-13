class dhcp::server {
    class variables inherits common::variables {
        include dns::variables

        # --------------------------------------------------------
        # Define default values...
        # --------------------------------------------------------

        $dhcp_defaultIdentifier       = $common_masterHost
        $dhcp_defaultDomainName       = $common_internalDomain
        $dhcp_defaultMaxLeaseTime     = '21600'
        $dhcp_defaultDefaultLeaseTime = '21600'
        $dhcp_defaultMinHostNumber    = $common_defaultHostNumber  + 1
        $dhcp_defaultMaxHostNumber    = $dhcp_defaultMinHostNumber + 1
        $dhcp_defaultZones            = ${dns::variables::zones}

        $dhcp_defaultSubnets = [
            {
                subnet           => "${common_subnet}",
                netmask          => "${common_netmask}",
                minIp            => "${common_defaultNetworkNumber}.${dhcp_defaultMinHostNumber}",
                maxIp            => "${common_defaultNetworkNumber}.${dhcp_defaultMaxHostNumber}",
                subnetMask       => "${common_netmask}",
                broadcastAddress => "${common_broadcastAddress}",
                routers          => "${common_gatewayIp}",
                dnsServers       => "${dns::dns_serverIp}",
                domainName       => "${common_internalDomain}",
            }
        ]

        # --------------------------------------------------------
        # Define values...
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

        $dhcp_leaseTime = $dhcp_leaseTime ? { 
            ''      => $dhcp_defaultDefaultLeaseTime,
            default => $dhcp_leaseTime,
        }   

        $dhcp_minHostNumber = $dhcp_minHostNumber ? { 
            ''      => $dhcp_defaultMinHostNumber,
            default => $dhcp_minHostNumber,
        }   

        $dhcp_maxHostNumber = $dhcp_maxHostNumber ? { 
            ''      => $dhcp_defaultMaxHostNumber,
            default => $dhcp_maxHostNumber,
        }   

        $dhcp_subnets = $dhcp_subnets ? { 
            ''      => $dhcp_defaultSubnets,
            default => $dhcp_subnets,
        }   

        $dhcp_zones = $dhcp_zones ? { 
            ''      => $dhcp_defaultZones,
            default => $dhcp_zones,
        }   
    }

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
