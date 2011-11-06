# Holds server defaults...
#   
# == Parameters
#   
# == Variables
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
# == Examples
#   
# == Authors
#   
# Author Name <author@domain.com>
#   
class service::dns::server_defaults {
    $localHost            = '127.0.0.1'

    $listenOn             = $::ipaddress
    $forwarders           = $defaults::gatewayIp
    $allowUpdate          = "${::ipaddress}; ${localHost};"

    $ttl                  = '86400'
    $notify               = 'yes'

    $reverseNetworkNumber = $defaults::reverseNetworkNumber
    $server               = $::fqdn
    $domain               = $defaults::internalDomain
}
