class services::samba::server {
    package { "samba":
        ensure => installed,
    }

    service { "smb":
        ensure  => running,
        enable  => true,
    }

    file { "/etc/samba/smb.conf":
        content => template ( "samba/smb.conf" ),
        notify => Service [ "smb" ],
    }
}
