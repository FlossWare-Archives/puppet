# This defines a DNS server
#   
# == Parameters
#  
# [*$localHost*]
#   The IP address for local host.
#   
# [*$listenOn*]
#   The address to listen upon to resolve names.
#   
# [*$forwarders*]
#   The address to forward requests to when names can't be resolved.
#   
# [*$allowUpdate*]
#   Address(es) to accept updates from.
#  
# [*$ttl*]
#   The time to live value.
#     
# [*$notify*]
#   The time to live value.
#     
# [*$reverseNetworkNumber*]
#   The reverse network number (values in reverse order of networkNumber) - for example in 102.168.168.252, the reverseNetworkNumber is 168.168.192
#   
# [*$server*]
#   The name of the server acting as the name server.
#   
# [*$domain*]
#   The domain for which the name server serves host names.
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
    $allowUpdate          = $service::dns::server_defaults::allowUpdate,
    $ttl                  = $service::dns::server_defaults::ttl,
    $notify               = $service::dns::server_defaults::notify,

    $reverseNetworkNumber = $service::dns::server_defaults::reverseNetworkNumber,
    $server               = $service::dns::server_defaults::server,
    $domain               = $service::dns::server_defaults::domain
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
