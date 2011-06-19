class services::postfix::client::variables {
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

class services::postfix::client inherits postfix::client::variables {
    include services::postfix::common
}
