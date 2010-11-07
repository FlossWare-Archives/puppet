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

    $postfix_myhostname = $postfix_myhostname ? {
        ''      => $postfix_defaultMyhostname
        default => $postfix_myhostname
    }

    $postfix_myorigin = $postfix_myorigin ? {
        ''      => $postfix_defaultMyorigin}
        default => $postfix_myorigin
    }

    $postfix_proxyInterfaces = $postfix_proxyInterfaces ? {
        ''      => $postfix_defaultProxyInterfaces
        default => $postfix_proxyInterfaces
    }

    $postfix_mydestination = $postfix_mydestination ? {
        ''      => $postfix_defaultMydestination
        default => $postfix_mydestination
    }


    file { "/etc/postfix/main.cf":
        content => template ( "postfix/main.cf.erb" ),
        notify  => Service [ "postfix" ],
    }
}

class postfix::client inherits postfix {
    $postfix_defaultRelayServer    = 'mailserver.flossware.com'
    $postfix_defaultInetInterfaces = 'all'

    $postfix_relaySever = $postfix_relaySever ? {
        ''      => $postfix_defaultRelayServer
        default => $postfix_relayServer
    }

    $postfix_inetInterfaces = $postfix_inetInterfaces ? {
        ''      => $postfix_defaultinetInterfaces
        default => $postfix_inetInterfaces
    }

    $postfix_myhostname = $postfix_myhostname ? {
        ''      => $postfix_defaultMyhostname
        default => $postfix_myhostname
    }

    $postfix_myorigin = $postfix_myorigin ? {
        ''      => $postfix_defaultMyorigin
        default => $postfix_myorigin
    }


    file { "/etc/postfix/main.cf":
        content => template ( "postfix/main.cf.erb" ),
        notify  => Service [ "postfix" ],
    }
}
