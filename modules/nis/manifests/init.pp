class nis inherits service {
    $packages = [
        "yp-tools",
    ]

    package { $packages:
        ensure => latest,
    }

    service { "yppasswdd":
        ensure  => running,
        enable  => true,
    }
}

class nis::client inherits nis {
    $nis_defaultServerIp   = ${adminIp}
    $nis_defaultDomainName = ${internalDomain}

    $nis_serverIp = $nis_serverIp ? { 
        ''      => $nis_defaultServerIp,
        default => $nis_erverIp,
    }   

    $nis_domainName = $nis_domainName ? { 
        ''      => $nis_defaultDomainName,
        default => $nis_domainName,
    }   

    $packages = [
        "ypbind",
    ]

    package { $packages:
        ensure => latest,
    }

    service { "ypbind":
        ensure  => running,
        enable  => true,
    }

    file { "/etc/yp.conf":
        content => template ( "nis/yp.conf.erb" ),
        notify  => Service [ "ypbind" ],
    }
}

class nis::server inherits nis {
    /* need to figure out /usr/lib/yp/ypinit -m*/

    $packages = "ypserv"

    package { $packages:
        ensure => latest,
    }

    service { "ypserv":
        ensure => running,
        enable => true,
    }
}
