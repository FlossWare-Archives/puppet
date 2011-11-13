# This defines a DNS server
#   
# == Parameters
#  
# [*$listenOn*]
#   The address to listen upon to resolve names.
#   
# [*$forwarders*]
#   The address to forward requests to when names can't be resolved.
#
# [*$zones*]
#   The zones this name server operates upon.  For example 168.168.192 and foo.com.
#
# [*$hostsMaps*]
#   The static hosts that this name server will return.  For example,
#     name   = foo
#     number = 2
#     cname  = webserver
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
# [*$networkNumber*]
#   The network number - for example in 192.168.168.252, the networkNumber is 192.168.168
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
    $listenOn             = $service::dns::server_defaults::listenOn,
    $forwarders           = $service::dns::server_defaults::forwarders,
    $domainZone           = $service::dns::server_defaults::domain,
    $reverseZone          = $service::dns::server_defaults::reverseNetworkNumber,
    $zone                 = $service::dns::server_defaults::zone,
    $hostsMap             = '',
    $allowUpdate          = $service::dns::server_defaults::allowUpdate,
    $ttl                  = $service::dns::server_defaults::ttl,
    $notifyChange         = $service::dns::server_defaults::notifyChange,

    $networkNumber        = $service::dns::server_defaults::networkNumber,
    $reverseNetworkNumber = $service::dns::server_defaults::reverseNetworkNumber,
    $server               = $service::dns::server_defaults::server,
    $domain               = $service::dns::server_defaults::domain
) inherits service::dns::server_defaults {
    util::enable_service_def {
        "${name}::named":
            packages => 'bind',
            service  => 'named',
    }

    file {
        '/etc/named.conf':
            content => template ( 'service/dns/named.conf.erb' ),
            owner   => 'named',
            group   => 'named',
            notify  => Service [ 'named' ], 
    }

    if ($domainZone or $reverseZone) {
        file {
            '/etc/named':
                ensure => directory,
                owner  => 'named',
                group  => 'named',
        }

        if ($domainZone) {
            service::dns::domain_zone_def {
                $domainZone:
                    server        => $server,
                    domain        => $domain,
                    networkNumber => $networkNumber,
                    ttl           => $ttl,
                    hostsMap      => $hostsMap,
            }
        }

        if ($reverseZone) {
            service::dns::reverse_network_number_def {
                $reverseZone:
                    server               => $server,
                    domain               => $domain,
                    reverseNetworkNumber => $reverseNetworkNumber,
                    ttl                  => $ttl,
                    hostsMap             => $hostsMap,
            }
        }
    }
}
