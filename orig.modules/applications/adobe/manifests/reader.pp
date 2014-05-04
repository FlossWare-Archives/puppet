class adobe::reader {
    $packages = [
        "AdobeReader_enu",
    ]

    package { $packages:
        ensure  => latest,
    }
}