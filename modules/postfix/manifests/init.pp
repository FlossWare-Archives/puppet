class postfix {
    class variables inherits common::variables {
        $postfix_defaultMyhostname = ${common_externalDomain}
        $postfix_defaultMyorigin   = ${common_externalDomain}
    }

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

class postfix::service {
    class variables inherits postfix::variables {
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
    }

    file { "/etc/postfix/main.cf":
        content => template ( "postfix/main.cf.erb" ),
        notify  => Service [ "postfix" ],
    }
}

class postfix::server inherits postfix {
    $postfix_defaultRelayHost       = "${defaults::externalRelayHost}"
    $postfix_defaultInetInterfaces  = "${common_masterHost}, ${common_masterFqdn}, localhost, localhost.localdomain"
    $postfix_defaultProxyInterfaces = $common_masterGatewayIp
    $postfix_defaultMydestination   = '\$myhostname, \$myhostname.$mydomain, localhost.\$mydomain, localhost, localhost.localdomain, ${common_externalDomain}'

    include postfix::service
}

class postfix::client inherits postfix {
    $postfix_defaultRelayHost      = "${defaults::internalRelayHost}"
    $postfix_defaultInetInterfaces = 'all'

    include postfix::service
}
