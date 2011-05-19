include common::variables

class variables ( $defaultRelayHost, $defaultInetInterfaces, $defaultMyhostname = $common::variables::common_externalDomain, $defaultMyorigin = $common::variables::common_externalDomain, $defaultProxyInterfaces = "", $defaultMydestination = "" ) inherits common::variables {
    $postfix_relayHost = $postfix_relayHost ? {
        ''      => $defaultRelayHost,
        default => $postfix_relayHost,
    }

    $postfix_inetInterfaces = $postfix_inetInterfaces ? {
        ''      => $defaultInetInterfaces,
        default => $postfix_inetInterfaces,
    }

    $postfix_myhostname = $postfix_myhostname ? {
        ''      => $defaultMyhostname
        default => $postfix_myhostname
    }

    $postfix_myorigin = $postfix_myorigin ? {
        ''      => $defaultMyorigin}
        default => $postfix_myorigin
    }

    $postfix_proxyInterfaces = $postfix_proxyInterfaces ? {
        ''      => $defaultProxyInterfaces
        default => $postfix_proxyInterfaces
    }

    $postfix_mydestination = $postfix_mydestination ? {
        ''      => $defaultMydestination
        default => $postfix_mydestination
    }
}

class postfix {
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

    file { "/etc/postfix/main.cf":
        content => template ( "postfix/main.cf.erb" ),
        notify  => Service [ "postfix" ],
    }
}

class postfix::server::variables {
    class {
        variables:
            defaultRelayHost       => "${common::common_externalRelayHost}",
            defaultInetInterfaces  => "${common::common_masterHost}, ${common::common_masterFqdn}, localhost, localhost.localdomain",
            defaultProxyInterfaces => $common::common_masterGatewayIp,
            defaultMydestination   => '\$myhostname, \$myhostname.$mydomain, localhost.\$mydomain, localhost, localhost.localdomain, ${common::common_externalDomain}',
    }

    $postfix_relayHost       = $variables::postfix_relayHost
    $postfix_inetInterfaces  = $variables::postfix_inetInterfaces
    $postfix_myhostname      = $variables::postfix_myhostname
    $postfix_myorigin        = $variables::postfix_myorigin
    $postfix_proxyInterfaces = $variables::postfix_proxyInterfaces
    $postfix_mydestination   = $variables::postfix_mydestination
}

class postfix::server inherits postfix::server::variables {
    include postfix
}

class postfix::client::variables {
    class {
        variables:
            defaultRelayHost       => "${common::common_internalRelayHost}",
            defaultInetInterfaces  => "all",
    }

    $postfix_relayHost       = $variables::postfix_relayHost
    $postfix_inetInterfaces  = $variables::postfix_inetInterfaces
    $postfix_myhostname      = $variables::postfix_myhostname
    $postfix_myorigin        = $variables::postfix_myorigin
    $postfix_proxyInterfaces = $variables::postfix_proxyInterfaces
    $postfix_mydestination   = $variables::postfix_mydestination
}

class postfix::client inherits postfix::client::variables {
    include postfix
}
