class services::postfix::server::variables {
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

class services::postfix::server inherits postfix::server::variables {
    include services::postfix::common
}
