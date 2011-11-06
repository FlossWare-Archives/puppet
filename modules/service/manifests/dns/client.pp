# This is for DNS clients.
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
class service::dns::client (
    $nameServer = $service::dns::client_defaults::nameServer,
    $domain     = $service::dns::client_defaults::domain,
    $search     = $service::dns::client_defaults::search,
) inherits service::dns::client_defaults {
    file {
        '/etc/resolv.conf':
            content => template ( "service/dns/resolv.conf.erb" ),
    }
}

