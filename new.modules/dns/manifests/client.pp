include common::variables

class services::dns::clientVariables ( $dns_client_defaultSearch = $common::common_internalDomain, $dns_client_defaultNameServer = $common::common_masterIp ) inherits common::variables {
    $dns_client_search = $dns_client_search ? {
        ''      => $dns_client_defaultSearch,
        default => $dns_client_search,
    }

    $dns_client_nameServer = $dns_client_nameServer ? {
        ''      => $dns_client_defaultNameServer,
        default => $dns_client_nameServer,
    }
}

class services::dns::client::variables {
    class {
        clientVariables:
    }

    $dns_client_search     = $clientVariables::dns_client_search
    $dns_client_nameServer = $clientVariables::dns_client_nameServer
}

class services::dns::client inherits dns::client::variables {
    file { "/etc/resolv.conf":
        content => template ( "dns/resolv.conf.erb" ),
    }
}

