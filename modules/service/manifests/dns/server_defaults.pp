# Holds server defaults...
#   
# == Parameters
#   
# == Variables
#   
# [*$localHost*]
#   The IP address for local host.
#     
# [*$networkNumber*]
#   The network number - for example in 192.168.168.252, the networkNumber is 192.168.168
#  
# [*$reverseNetworkNumber*]
#   The reverse network number (values in reverse order of networkNumber) - for example in 192.168.168.252, the reverseNetworkNumber is 168.168.192
#  
# [*$domain*]
#   The domain for which the name server serves host names.
#   
# [*$listenOn*]
#   The address to listen upon to resolve names.
#   
# [*$forwarders*]
#   The address to forward requests to when names can't be resolved.
#     
# [*$notify*]
#   The time to live value.
#   
# [*$allowUpdate*]
#   Address(es) to accept updates from.
#  
# [*$ttl*]
#   The time to live value.
#   
# [*$server*]
#   The name of the server acting as the name server.
#   
# == Examples
#   
# == Authors
#   
# Author Name <author@domain.com>
#   
class service::dns::server_defaults inherits defaults {
    $localHost            = '127.0.0.1'
    $networkNumber        = $defaults::networkNumber

    $listenOn             = $::ipaddress
    $forwarders           = $defaults::gatewayIp
    $domainZone           = $defaults::internalDomain
    $networkZone          = $defaults::reverseNetworkNumber
    $zoneType             = 'master'
    $notifyChange         = 'yes'
    $allowUpdate          = "${::ipaddress}; ${localHost};"

    $ttl                  = '86400'

    $server               = $::fqdn
}
