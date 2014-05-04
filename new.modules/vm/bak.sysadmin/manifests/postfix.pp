class postfix::base {
    $default_myhostname = ${sysadmin::variables::external_domain}
    $default_myorigin   = ${sysadmin::variables::external_domain}


    package { "postfix":
        ensure => installed,
    }

    service { "postfix":
        ensure  => running,
        enable  => true,
    }
}

class postfix::server inherits postfix::base {
    $default_relay_server     = 'smtp-server.nc.rr.com'
    $default_inet_interfaces  = '${sysadmin::variables::adminserver_host} , ${sysadmin::variables::adminserver_fqdn}, localhost, localhost.localdomain'
    $default_proxy_interfaces = ${sysadmin::variables::default_gateway_ip}
    $default_mydestination    = '\$myhostname, \$myhostname.$mydomain, localhost.\$mydomain, localhost, localhost.localdomain, ${sysadmin::variables::external_domain}'

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
        content => template ( "sysadmin/postfix/main.cf.erb" ),
        notify => Service [ "postfix" ],
    }
}

class postfix::client inherits postfix::base {
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
        content => template ( "sysadmin/postfix/main.cf.erb" ),
        notify => Service [ "postfix" ],
    }
}
