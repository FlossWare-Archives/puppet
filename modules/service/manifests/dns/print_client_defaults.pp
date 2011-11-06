# Print out the variables from client_defaults.pp
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
class service::dns::print_client_defaults inherits service::dns::client_defaults {
    notice ( "nameServer [${nameServer}]  domain [${domain}]  search [${search}]" )
}

