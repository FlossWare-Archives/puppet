# Holds client defaults...
#   
# == Parameters
#   
# == Variables
#   
# [*$nameServer*]
#   The actual name server.
#   
# [*$domain*]
#   The domain that the client belongs to.
#   
# [*$search*]
#   The domain to search when resolving hosts.
#   
# == Examples
#   
# == Authors
#   
# Author Name <author@domain.com>
#   
class service::dns::client_defaults {
    $nameServer = $defaults::gatewayIp
    $domain     = $defaults::internalDomain
    $search     = $defaults::internalDomain
}

