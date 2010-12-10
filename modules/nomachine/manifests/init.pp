class nomachine::client {
    $packages = [
        "nxclient",
    ]

    package { $packages:
        ensure => latest,
    }
}

class nomachine::server {
    $packages = [
        "nxserver",
    ]

    package { $packages:
        ensure => latest,
    }
}

class nomachine {
    include nomachine::client
    include nomachine::server
}


