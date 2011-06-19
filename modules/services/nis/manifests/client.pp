class services::nis::client {
    include services::nis::common

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
