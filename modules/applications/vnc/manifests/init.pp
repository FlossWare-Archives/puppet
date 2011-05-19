class vnc {
    case $operatingsystem {
        CentOS: {
            $packages = [
            "vnc",
            "vnc-server"
            ]
        }

        Fedora: {
            $packages = [
            "tigervnc",
            "tigervnc-server"
            ]
        }
    }

    package { $packages:
        ensure => latest,
    }

}

