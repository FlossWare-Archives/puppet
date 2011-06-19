class services::portmap {
    case $operatingsystem {
        CentOS: {
            $packages = [
                "portmap",
            ]

            $service = "portmap"
        }   

        Fedora: {
            $packages = [
                "portreserve",
            ]

            $service = "portreserve"
        }   
    }   

    package { $packages:
        ensure => installed,
    }   

    service { $service:
        ensure  => running,
        enable  => true,
    }   
}
