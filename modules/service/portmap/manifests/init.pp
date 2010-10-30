class portmap {
    case $operatingsystem {
        CentOS: {
            $packages = [
                "portmap",
            ]

            package { $packages:
                ensure => installed,
            }   

            service { "portmap":
                ensure  => running,
                enable  => true,
            }   
        }   

        Fedora: {
            $packages = [
                "portreserve",
            ]

            package { $packages:
                ensure => installed,
            }   

            service { "portreserve":
                ensure  => running,
                enable  => true,
            }   
        }   
    }   
}
