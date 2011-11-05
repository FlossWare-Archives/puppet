# This defines a DNS server
#   
# == Parameters
#   
# [*nameServer*]
#   The name server host for resolving hosts.
#   
# [*domain*]
#   The domain that the client belongs to.
#   
# [*search*]
#   The domain to search when resolving hosts.
#   
# == Variables
#   
# == Examples
#   
# Set up a client whose domain is foo.com and the name server
# is 192.168.168.253
#
# service::dns::client {
#     nameServer => 192.168.168.253,
#     domain     => foo.com,
#     search     => foo.com,
# }
#   
#   
# == Authors
#   
# Author Name <author@domain.com>
#   
class service::dns::server ( 
    $zones,
    $listenOn             = $service::dns::server_defaults::listenOn,
    $forwarders           = $service::dns::server_defaults::forwarders,
    $parentServer         = $service::dns::server_defaults::parentServer,
    $reverseNetworkNumber = $service::dns::server_defaults::reverseNetworkNumber,
    $server               = $service::dns::server_defaults::server,
    $domain               = $service::dns::server_defaults::domain,
    $ttl                  = $service::dns::server_defaults::ttl
) inherits services::dns::server_defaults {
    util::enable_service_def {
        "${name}::named":
            packages => 'bind',
            service  => 'named',
    }

    service::dns::domain_zone_def {
        $zones:
    }

    service::dns::reverse_network_number_def {
        $zones:
    }
}
