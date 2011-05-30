class nx {
    case $operatingsystem {
        CentOS: {
			$serverPackages = [ "freenx", "nx" ]
        }

        Fedora: {
			$serverPackages = [ "freenx-server" ]
		}
    }

    package { $serverPackages:
        ensure => latest,
    }

    exec { "nxsetup":
        command   => "bash -c 'export PATH=/usr/bin:/usr/sbin:/bin:$PATH ; nxsetup --install --setup-nomachine-key'",
        subscribe => Package [ $serverPackages ],
        path      => "/usr/bin:/usr/sbin:/bin",
    }
}
