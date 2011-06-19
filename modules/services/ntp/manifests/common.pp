class services::ntp::common {
    $packages = [
        "ntp",
        "ntpdate",
    ]

    package { $packages:
        ensure => latest,
    }

    service { "ntpdate":
        enable  => true,
    }

    service { "ntpd":
        ensure  => running,
        enable  => true,
    }

    file { "/etc/ntp.conf":
        content => template ( "ntp/client/ntp.conf" ),
        notify  => Service [ "ntpd" ]
    }
}
