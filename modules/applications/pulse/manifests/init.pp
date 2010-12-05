class pulse {
    package { "dovecot":
        ensure => installed,
    }

    service { "dovecot":
        ensure  => running,
        enable  => true,
    }

    file { "/etc/dovecot.conf":
        source => "puppet:///modules/dovecot/dovecot.conf",
        notify => Service [ "dovecot" ],
    }
}

