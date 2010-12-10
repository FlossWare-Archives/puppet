class realnetworks::realplayer {
    $packages = [
        "RealPlayer",
    ]

    package { $packages:
        ensure => latest,
    }
}

class realnetworks {
    include realnetworks::realplayer
}
