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
    notice ( "localHost [${localHost}]  reverseNetworkNumber [${reverseNetworkNumber}]  domain [${domain}]  listenOn [${listenOn}]  forwarders [${forwarders}]  domainZone [${domainZone}]  reverseZone [${reverseZone}]  zones [${zones}]  notifyChange [${notifyChange}]  allowUpdate [${allowUpdate}]  ttl [${ttl}]  server [${server}]" )
}
