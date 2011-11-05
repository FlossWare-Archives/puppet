# This defines a DNS server
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
class services::dns::server ( $listenOn, $forwarders, $zones, $parentServer, $reverseSubIp, $server = $::fqdn, $domain = ::$domain, $ttl = '86400' ) inherits services::dns::server_defaults {
    $packages = [
        "bind",
    ]

    package { $packages:
        ensure => installed,
    }

    service { "named":
        ensure  => running,
        enable  => true,
    }

    service::dns::domain_zone_def {
        $zones:
    }

    service::dns::reverse_network_number_def {
        $zones:
    }
}
