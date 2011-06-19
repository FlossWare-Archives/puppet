include common::variables

class services::postfix::variables ( $defaultRelayHost, $defaultInetInterfaces, $defaultMyhostname = $common::variables::common_externalDomain, $defaultMyorigin = $common::variables::common_externalDomain, $defaultProxyInterfaces = "", $defaultMydestination = "" ) inherits common::variables {
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

class services::postfix::common {
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

