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
class service::dns::server ( $serverMap ) {
    service::dns::mapped_server_def {
        "service::dns::server::${name}":
            serverMap => $serverMap,
    }
}
