class smb::base {
    package { "samba":
        ensure => installed,
    }

    service { "smb":
        ensure  => running,
        enable  => true,
    }
}

class smb::server inherits smb::base {
    file { "/etc/samba/smb.conf":
        content => template ( "samba/smb.conf" ),
        notify => Service [ "smb" ],
    }
}
