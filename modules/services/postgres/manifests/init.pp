class postgres inherits service {
    package { "postgresql":
        ensure => installed,
    }
}

class postgres::server inherits postgres {
    package { "postgresql-server":
        ensure => installed,
    }

    service { "postgresql":
        ensure  => running,
        enable  => true,
    }

    file { "/var/lib/pgsql/pg_hba.conf":
        content => template ( "postgres/pg_hba.conf" ),
        notify  => Service [ "postgresql" ],
        owner   => "postgres",
        group   => "postgres",
    }
}

class postgres::client inherits postgres {
}
