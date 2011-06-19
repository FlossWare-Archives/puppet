class services::crond {
    service { "crond":
        ensure => running,
        enable => true,
    }
}

