class crond {
    service { "crond":
        ensure => running,
        enable => true,
    }
}

