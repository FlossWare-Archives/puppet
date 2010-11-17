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

    class postfixService {
        $postfix_relayHost = $postfix_relayHost ? {
            ''      => $postfix_defaultRelayHost,
            default => $postfix_relayHost,
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
}

class postfix::server inherits postfix {
    $postfix_defaultRelayHost       = "${defaults::externalRelayHost}"
    $postfix_defaultInetInterfaces  = "${service_adminHost}, ${service_adminFqdn}, localhost, localhost.localdomain"
    $postfix_defaultProxyInterfaces = $service_gatewayIp
    $postfix_defaultMydestination   = '\$myhostname, \$myhostname.$mydomain, localhost.\$mydomain, localhost, localhost.localdomain, ${service_externalDomain}'

    include postfixService
}

class postfix::client inherits postfix {
    $postfix_defaultRelayHost      = "${defaults::internalRelayHost}"
    $postfix_defaultInetInterfaces = 'all'

    include postfixService
}
