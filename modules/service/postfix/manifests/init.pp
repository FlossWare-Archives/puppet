class postfix inherits service {
    $default_myhostname = ${variables::external_domain}
    $default_myorigin   = ${variables::external_domain}

    $packages = [
        "postfix",
    ]

    package { $packages:
        ensure => installed,
    }

    service { "postfix":
        ensure  => running,
        enable  => true,
    }
}

class postfix::server inherits postfix {
    $default_relay_server     = 'smtp-server.nc.rr.com'
    $default_inet_interfaces  = '${variables::adminserver_host} , ${variables::adminserver_fqdn}, localhost, localhost.localdomain'
    $default_proxy_interfaces = ${variables::default_gateway_ip}
    $default_mydestination    = '\$myhostname, \$myhostname.$mydomain, localhost.\$mydomain, localhost, localhost.localdomain, ${variables::external_domain}'

    $relay_sever = $relay_sever ? {
        ''      => ${default_relay_server}
        default => ${relay_server}
    }

    $inet_interfaces = $inet_interfaces ? {
        ''      => ${default_inet_interfaces}
        default => ${inet_interfaces}
    }

    $myhostname = $myhostname ? {
        ''      => ${postfix::base::default_myhostname}
        default => ${myhostname}
    }

    $myorigin = $myorigin ? {
        ''      => ${postfix::base::default_myorigin}
        default => ${myorigin}
    }

    $proxy_interfaces = $proxy_interfaces ? {
        ''      => ${postfix::base::default_proxy_interfaces}
        default => ${proxy_interfaces}
    }

    $mydestination = $mydestination ? {
        ''      => ${default_mydestination}
        default => ${mydestination}
    }


    file { "/etc/postfix/main.cf":
        content => template ( "postfix/main.cf.erb" ),
        notify => Service [ "postfix" ],
    }
}

class postfix::client inherits postfix {
    $default_relay_server    = 'mailserver.flossware.com'
    $default_inet_interfaces = 'all'

    $relay_sever = $relay_sever ? {
        ''      => ${default_relay_server}
        default => ${relay_server}
    }

    $inet_interfaces = $inet_interfaces ? {
        ''      => ${defaultinet_interfaces}
        default => ${inet_interfaces}
    }

    $myhostname = $myhostname ? {
        ''      => ${postfix::base::default_myhostname}
        default => ${myhostname}
    }

    $myorigin = $myorigin ? {
        ''      => ${postfix::base::default_myorigin}
        default => ${myorigin}
    }


    file { "/etc/postfix/main.cf":
        content => template ( "postfix/main.cf.erb" ),
        notify => Service [ "postfix" ],
    }
}
