# Print out the variables from server_defaults.pp
#   
# == Parameters
#   
# == Variables
#   
# == Examples
#   
# == Authors
#   
# Author Name <author@domain.com>
#   
class service::dns::print_server_defaults inherits service::dns::server_defaults {
    $localHost            = '127.0.0.1'
    $reverseNetworkNumber = $defaults::reverseNetworkNumber
    $domain               = $defaults::internalDomain

    $listenOn             = $::ipaddress
    $forwarders           = $defaults::gatewayIp
    $zones                = [ $reverseNetworkNumber, $domain ]
    $notify               = 'yes'
    $allowUpdate          = "${::ipaddress}; ${localHost};"

    $ttl                  = '86400'

    $server               = $::fqdn

    notice ( "localHost [${localHost}]  reverseNetworkNumber [${reverseNetworkNumber}]  domain [${domain}]  listenOn [${listenOn}]  forwarders [${forwarders}]  zones [${zones}]  notify [${notify}]  allowUpdate [${allowUpdate}]  ttl [${ttl}]  server [${server}]" )
}
