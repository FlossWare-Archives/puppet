class adobe::release {
    $packages = [
        "adobe-release-$architecture",
    ]

    package { $packages:
        ensure  => latest,
    }
}

class adobe::flash {
    $packages = [
        "flash-plugin",
    ]

    package { $packages:
        ensure  => latest,
    }
}

class adobe::reader {
    $packages = [
        "AdobeReader_enu",
    ]

    package { $packages:
        ensure  => latest,
    }
}

class adobe {
    include adobe::release
    include adobe::player
    include adobe::reader
}
