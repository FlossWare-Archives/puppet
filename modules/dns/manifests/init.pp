class dns {
    class variables inherits common:variables {
        $dns_defaultSearch = $defaults::dns_defaultSearch ? {
            ''      => $common_internalDomain,
            default => $defaults::dns_defaultSearch,
        }

        $dns_defaultNameServer = $defaults::dns_defaultNameServer ? {
            ''      => $common_masterHost,
            default => $defaults::dns_defaultNameServer,
        }

        $dns_search = $dns_search ? {
            ''      => $dns_defaultSearch,
            default => $dns_search
        }

        $dns_nameServer = $dns_nameServer ? {
            ''      => $dns_defaultNameServer,
            default => $dns_nameServer
        }
    }
}

class dns::client inherits dns {
    file { "/etc/resolv.conf":
        content => template ( "dns/resolv.conf.erb" ),
    }
}

class dns::server {
    class variables inherits dns::variables {
        $dns_defaultTTL = $defaults::dns_defaultTTL ? {
            ''      => "86400",
            default => $defaults::dns_defaultTTL,
        }

        $dns_defaultListenOn = $defaults::dns_defaultListenOn ? {
            ''      => "${common_adminIp};",
            default => $defaults::dns_defaultListenOn,
        }

        $dns_defaultForwarders = $defaults::dns_defaultForwarders ? {
            ''      => "${common_gatewayIp};",
            default => $defaults::dns_defaultForwarders,
        }

        $dns_defaultAllowUpdate = $defaults::dns_defaultAllowUpdate ? {
            ''      => "${dns_defaultListenOn}; 127.0.0.1;",
            default => $defaults::dns_defaultAllowUpdate,
        }

        $dns_defaultZones = $defaults::dns_defaultZones ? {
            ''      => [ "$common_defaultInternalDomain", "${dns_reverseBaseIp}.in-addr.arpa", ],
            default => $defaults::dns_defaultZones,
        }

        $dns_defaultDomain = $defaults::dns_defaultDomain ? {
            ''      => "${common_internalDomain}",
            default => $defaults::dns_defaultDomain,
        }


        $dns_defaultNetworkNumber = $defaults::dns_defaultNetworkNumber ? {
            ''      => "${common_networkNumber}",
            default => $defaults::dns_defaultNetworkNumber,
        }

        $dns_defaultNameServer = $defaults::dns_defaultNameServer ? {
            ''      => "${common_masterIp}",
            default => $defaults::dns_defaultNameServer,
        }

        $dns_ttl = $dns_ttl ? {
            ''      => $dns_defaultTTL,
            default => $dns_ttl,
            }

        $dns_defaultReverseBaseIp = $dns_defaultReverseBaseIp ? { 
            ''      => $defaults::reverseBaseIp,
            default => $dns_defaultReverseBaseIp,
        }   

        $dns_ListenOn = $dns_listenOn ? {
            ''      => $dns_defaultListenOn,
            default => $dns_listenOn,
            }

        $dns_forwarders = $dns_forwarders ? {
            ''      => $dbs_defaultForwarders,
            default => $dns_forwarders,
            }

        $dns_allowUpdate = $dns_allowUpdate ? {
            ''      => $dns_defaultAllowUpdate,
            default => $dns_allowUpdate,
            }

        $dns_zones = $dns_zones ? {
            ''      => $dns_defaultZones,
            default => $dns_zones
        }

        $dns_domain = $dns_domain ? {
            ''      => $dns_defaultDomain,
            default => $dns_domain
        }

        $dns_baseIp = $dns_baseIp ? {
            ''      => $dns_defaultBaseIp,
            default => $dns_baseIp
        }

        $dns_hosts = $dns_hosts ? {
            ''      => $dns_defaultHosts,
            default => $dns_hosts
        }
    }

    # ------------------------------------------------------

    define zoneFile() {
        file { "/etc/named/${name}":
            content => template ( "dns/named/${name}.erb" ),
            owner   => "named",
            group   => "named",
            notify  => service [ "named" ],
        }
    }

    # ------------------------------------------------------

    $packages = [
        "bind",
    ]

    package { $packages:
        ensure => installed,
    }

    service { "named":
        ensure  => running,
        enable  => true,
    }

    file { "/etc/named":
        ensure => directory,
        owner  => "named",
        group  => "named",
    }

    file { "/etc/named.conf":
        content => template ( "dns/named.conf.erb" ),
        owner   => "named",
        group   => "named",
        notify  => Service [ "named" ],
    }

    zoneFile { $variables::dns_zones: }

    include dns::client
}
