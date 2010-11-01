class postfix inherits service {
    $postfix_defaultMyhostname = ${service_externalDomain}
    $postfix_defaultMyorigin   = ${service_externalDomain}

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
    $postfix_defaultRelayServer     = "smtp-server.nc.rr.com"
    $postfix_defaultInetInterfaces  = "${service_adminHost}, ${service_adminFqdn}, localhost, localhost.localdomain"
    $postfix_defaultProxyInterfaces = $service_gatewayIp
    $postfix_defaultMydestination   = '\$myhostname, \$myhostname.$mydomain, localhost.\$mydomain, localhost, localhost.localdomain, ${variables::external_domain}'

    $postfix_relayServer = $postfix_relayServer ? {
        ''      => $postfix_defaultRelayServer,
        default => $postfix_relayServer,
    }

    $postfix_inetInterfaces = $postfix_inetInterfaces ? {
        ''      => $postfix_defaultInetInterfaces,
        default => $postfix_inetInterfaces,
    }

    $myhostname = $myhostname ? {
        ''      => $postfix::base::default_myhostname
        default => $myhostname
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
