class services::dhcp inherits services::dhcp::defaults {
    $packages = [
        "dhcp",
    ]

    package { $packages:
        ensure => installed,
    }

    service { "dhcpd":
        ensure  => running,
        enable  => true,
    }

    $configFile = $operatingsystem ? {
        'CentOS' => "/etc/dhcpd.conf",
        'Fedora' => "/etc/dhcp/dhcpd.conf",
    }

    file { "${configFile}":
        content => template ( "dhcp/dhcpd.erb" ),
        notify  => Service  [ "dhcpd" ],
    }
}
