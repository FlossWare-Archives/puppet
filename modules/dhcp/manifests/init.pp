class dhcp::server {
    class variables inherits common::variables {
        include dns::variables

        # --------------------------------------------------------
        # Define default values...
        # --------------------------------------------------------

        $dhcp_defaultIdentifier = $defaults::dhcp_defaultIdentifier ? { 
            ''      => $service_masterHost,
            default => $defaults::dhcp_defaultIdentifier,
        }

        $dhcp_defaultDomainName = $defaults::dhcp_defaultDomainName ? {
            ''      => $service_internalDomain,
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

        $dhcp_defaultMinHostNumber = $defaults::dhcp_defaultMinHostNumber ? {
            ''      => $service_defaultHostNumber + 1,
            default => $defaults::dhcp_defaultMinHostNumber,
        }

        $dhcp_defaultMaxHostNumber = $defaults::dhcp_defaultMaxHostNumber ? {
            ''      => $dhcp_defaultMinHostNumber + 1,
            default => $defaults::dhcp_defaultMaxHostNumber,
        }

        $dhcp_defaultSubnets = $defaults::dhcp_defaultSubnets ? {
            '' => [
                {
                    subnet           => "${service_subnet}",
                    netmask          => "${service_netmask}",
                    minIp            => "${service_defaultNetworkNumber}.${dhcp_defaultMinHostNumber}",
                    maxIp            => "${service_defaultNetworkNumber}.${dhcp_defaultMaxHostNumber}",
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
