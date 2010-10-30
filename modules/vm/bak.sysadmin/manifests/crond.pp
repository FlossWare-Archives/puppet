class sysadmin::crond {
    service { "crond":
        ensure => running,
        enable => true,
    }
}
