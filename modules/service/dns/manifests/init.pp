class dns inherits service {
    $dns_defaultListenOn    = "${service_adminIp};"
    $dns_defaultForwarders  = "${service_gatewayIp};"
    $dns_defaultAllowUpdate = "${dns_defaultListenOn}; 127.0.0.1;"
    $dns_defaultZones       = [ "$service_defaultInternalDomain", "${service_reverseBaseIp}.in-addr.arpa", ]

    $dns_defaultSearch      = "${service_internalDomain}"
    $dns_defaultNameServer  = "${service_adminIp}"

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

    $dns_search = $dns_search ? {
        ''      => $dns_defaultSearch,
        default => $dns_search
    }

    $dns_nameServer = $dns_nameServer ? {
        ''      => $dns_defaultNameServer,
        default => $dns_nameServer
    }
}

class dns::client inherits dns {
    file { "/etc/resolv.conf":
        content => template ( "dns/resolv.conf.erb" ),
    }
}

class dns::server inherits dns {
    define zoneFile() {
        file { "/etc/named":
            ensure => directory,
            owner  => "named",
            group  => "named",
        }

        file { "/etc/named/${name}":
            content => template ( "dns/named/${name}.erb" ),
            owner   => "named",
            group   => "named",
            notify  => service [ "named" ],
        }

    }

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

    file { "/etc/named.conf":
        content => template ( "dns/named.conf.erb" ),
        owner   => "named",
        group   => "named",
        notify  => Service [ "named" ],
    }

    zoneFile { $dns_zones: }

    include dns::client
}
