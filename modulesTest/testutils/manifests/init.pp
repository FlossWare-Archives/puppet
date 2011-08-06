class testUtils {
    notice ( 'Attempting to enable repo centosplus' )

    util::enable_repo {
        'centosplus':
    }

    notice ( 'Attempting to enable service syslogd' )

    util::enable_service {
        'syslog':
            service => 'syslog'
    }

    notice ( 'Attempting to gnome-desktop' )

    util::install_group {
        'gnome-desktop':
    }

    notice ( 'Enabling FlossWare' )

    yumrepo {
        flossware:
            name         => "flossware",
            baseurl      => "http://adminserver:80/cobbler/repo_mirror/${::operatingsystem}-${::operatingsystemrelease}-flossware-${::architecture}",
            enabled      => "1",
            enablegroups => "1",
            gpgcheck     => "0",
    }

    notice ( 'Attempting to install package fvwm' )

    util::install_package {
        'fvam':
            packages => 'fvwm',
    }

    notice ( 'Attempting to install repo epel' )

    /*
    util::install_remote_repo {
        'rpmfusion':
            remoteRpm => "http://download.fedora.redhat.com/pub/epel/${lsbmajdistrelease}/${architecture}/epel-release-5-4.noarch.rpm",
    }
    */

    notice ( 'Attempting to mount /home' )

    util::mount_dir {
        '/home':
            device => 'adminserver:/home',
    }
}
