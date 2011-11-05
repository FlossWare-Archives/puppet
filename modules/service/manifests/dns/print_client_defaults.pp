# Emit the values of variables...
#   
# == Parameters
#   
# == Variables
#   
# == Authors
#   
# Author Name <author@domain.com>
#   
class service::dns::print_client_defaults inherits service::dns::client_defaults {
    notice ( "nameServer [${nameServer}]  domain [${domain}]  search [${search}]" )
}

