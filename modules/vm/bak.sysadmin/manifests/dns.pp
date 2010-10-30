class dns::variables {
    $default_dns_server_ip     = ${sysadmin::variables::adminserver_ip}
    $default_dns_forwarders_ip = '192.168.168.1;'

    $dns_server_ip = $dns_server_ip ? {
        ''      => ${default_dns_server_ip}
        default => ${dns_server_ip}
        }

    $dns_forwarders_ip = $dns_forwarders_ip ? {
        ''      => ${default_dns_forwarders_ip}
        default => ${dns_forwarders_ip}
        }
}

class dns::client {
    file { "/etc/resolv.conf":
        content => template ( "sysadmin/dns/client/resolv.conf.erb" ),
    }
}

class dns::server {
    package { "bind":
        ensure => installed,
    }

    service { "named":
        ensure  => running,
        enable  => true,
    }

    file { "/etc/named.conf":
        content => template ( "sysadmin/dns/server/named.conf.erb" ),
        owner   => "named",
        group   => "named",
        notify  => Service [ "named" ],
    }

    file { "/etc/named":
        ensure => directory,
        owner  => "named",
        group  => "named",
    }

    file { "/etc/named/db.flossware.com":
        content => template ( "sysadmin/dns/server/named/db.flossware.com.erb" ),
        owner   => "named",
        group   => "named",
        notify  => Service [ "named" ],
    }

    file { "/etc/named/db.192.168.168":
        content => template ( "sysadmin/dns/server/named/db.192.168.168.erb" ),
        owner   => "named",
        group   => "named",
        notify  => Service [ "named" ],
    }
}
