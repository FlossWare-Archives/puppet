class dns::variables inherits common::variables {
    $dns_defaultSearch     = $common_internalDomain
    $dns_defaultNameServer = $common_masterHost
    $dns_search            = $dns_defaultSearch
    $dns_nameServer        = $dns_defaultNameServer
}

class dns::client {
    include dns::variables

    file { "/etc/resolv.conf":
        content => template ( "dns/resolv.conf.erb" ),
    }
}

class dns::server {
    class variables inherits dns::variables {
        $dns_defaultTTL                  = "86400"
        $dns_defaultListenOn             = "${common_masterIp};"
        $dns_defaultForwarders           = "${common_gatewayIp};"
        $dns_defaultAllowUpdate          = "${dns_defaultListenOn}; 127.0.0.1;"
        $dns_defaultDomain               = "${common_internalDomain}"
        $dns_defaultNetworkNumber        = "${common_networkNumber}"
        $dns_defaultNameServer           = "${common_masterIp}"
        $dns_defaultReverseNetworkNumber = $common_reverseNetworkNumber

        $dns_defaultZones = [
            "$common_defaultInternalDomain", 
            "${dns_reverseNetworkNumber}.in-addr.arpa",
        ]


        $dns_ttl = $dns_ttl ? {
            ''      => $dns_defaultTTL,
            default => $dns_ttl,
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
