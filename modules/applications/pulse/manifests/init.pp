class pulse {
    # --------------------------------------------------------
    # Define default values... 
    # --------------------------------------------------------

    $pulse_defaultSampleChannels = "2"

    $packages = [
        "pulseaudio",
    ]

    package { $packages:
        ensure => installed,
    }

    $files = [
        "/etc/pulseaudio/daemon.conf",
    ]

    file { $files:
        content => template ( "puleaudio/daemon.conf.erb" ),
    }

    $commands = [
        "/usr/bin/killall pulseaudio; /usr/bin/pulseaudio -D --system"
    ]

    exec { $commands:
        subscribe   => File [ $files ],
        refreshonly => true,
    }
}

