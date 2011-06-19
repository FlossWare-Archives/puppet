include common::variables

class services::dns::serverVariables (
    $dns_server_defaultTTL                      = "86400",
    $dns_server_defaultListenOn                 = "${common::common_masterIp};",
    $dns_server_defaultForwarders               = "${common::common_gatewayIp};",
    $dns_server_defaultAllowUpdate              = "${common::common_masterIp}; 127.0.0.1;",
    $dns_server_defaultDomain                   = "${common::common_internalDomain}",
    $dns_server_defaultNetworkNumber            = "${common::common_networkNumber}",
    $dns_server_defaultHosts                    = "",
    $dns_server_defaultNameServer               = "${common::common_masterIp}",
    $dns_server_defaultDomainZone               = "${common::common_server_defaultInternalDomain}",
    $dns_server_defaultReverseNetworkNumberZone = "${common::common_reverseNetworkNumber}"
    $dns_server_defaultNameServer               = "${common::common_gatewayIp}"
    ) inherits common::variables {

    $dns_server_ttl = $dns_server_ttl ? {
        ''      => $dns_server_defaultTTL,
        default => $dns_server_ttl,
    }


    $dns_server_ListenOn = $dns_server_listenOn ? {
        ''      => $dns_server_defaultListenOn,
        default => $dns_server_listenOn,
    }

    $dns_server_forwarders = $dns_server_forwarders ? {
        ''      => $dbs_defaultForwarders,
        default => $dns_server_forwarders,
    }

    $dns_server_allowUpdate = $dns_server_allowUpdate ? {
        ''      => $dns_server_defaultAllowUpdate,
        default => $dns_server_allowUpdate,
    }

    $dns_server_domain = $dns_server_domain ? {
        ''      => $dns_server_defaultDomain,
        default => $dns_server_domain,
    }

    $dns_server_networkNumber = $dns_server_networkNumber ? {
        ''      => $dns_server_defaultNetworkNumber,
        default => $dns_server_networkNumber,
    }

    $dns_server_hosts = $dns_server_hosts ? {
        ''      => $dns_server_defaultHosts,
        default => $dns_server_hosts,
    }

    $dns_server_domainZone = $dns_server_domainZone ? {
        ''      => $dns_server_defaultDomainZone,
        default => $dns_server_domainZone,
    }

    $dns_server_reverseNetworkNumberZone = $dns_server_reverseNetworkNumberZone ? {
        ''      => $dns_server_defaultReverseNetworkNumberZone,
        default => $dns_server_reverseNetworkNumberZone,
    }

    $dns_server_nameServer = $dns_server_nameServer ? {
        ''      => $dns_server_defaultNameServer,
        default => $dns_server_nameServer,
    }
}

class services::dns::server::variables inherits common::variables {
    class {
        serverVariables:
    }

    $dns_server_ttl                      = $serverVariables::dns_server_ttl
    $dns_server_ListenOn                 = $serverVariables::dns_server_listenOn
    $dns_server_forwarders               = $serverVariables::dns_server_forwarders
    $dns_server_allowUpdate              = $serverVariables::dns_server_allowUpdate
    $dns_server_domain                   = $serverVariables::dns_server_domain
    $dns_server_networkNumber            = $serverVariables::dns_server_networkNumber
    $dns_server_hosts                    = $serverVariables::dns_server_hosts
    $dns_server_domainZone               = $serverVariables::dns_server_domainZone
    $dns_server_reverseNetworkNumberZone = $serverVariables::dns_server_reverseNetworkNumberZone
    $dns_server_nameServer               = $serverVariables::dns_server_nameServer

    $dns_client_nameServer               = $dns_server_nameServer
}


class services::dns::server inherits dns::server::variables {
    # ------------------------------------------------------

    define domainZoneFile() {
        file { "/etc/named/${name}":
            content => template ( "dns/named/domain.erb" ),
            owner   => "named",
            group   => "named",
            notify  => service [ "named" ],
        }
    }

    define reverseNetworkNumberZoneFile() {
        file { "/etc/named/${name}":
            content => template ( "dns/named/reverse_network_number.in-addr.arpa.erb" ),
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

    domainZoneFile { $dns_zones: }

    include dns::client
}
