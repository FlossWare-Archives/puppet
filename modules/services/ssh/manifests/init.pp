class profile::ssh {
    $packages = [
        "openssh-server",
    ]

    package { $packages:
        ensure => installed,
    }   

    service { "sshd":
        ensure  => running,
        enable  => true,
    }   
}
