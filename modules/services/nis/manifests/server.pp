class services::nis::server {
    include services::nis::common

    /* need to figure out /usr/lib/yp/ypinit -m*/

    $packages = "ypserv"

    package { $packages:
        ensure => latest,
    }

    service { "ypserv":
        ensure => running,
        enable => true,
    }
}
