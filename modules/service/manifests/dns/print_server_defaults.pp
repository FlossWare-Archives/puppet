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
    notice ( "localHost [${localHost}]  listenOn [${listenOn}]  forwarders [${forwarders}]  allowUpdate [${allowUpdate}]  ttl [${ttl}]  notify [${notify}]  reverseNetworkNumber [${reverseNetworkNumber}]  server [${server}]  domain [${domain}]" )
}
