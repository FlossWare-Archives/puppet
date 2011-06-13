class adobe::flash {
    $packages = [
        "flash-plugin",
    ]

    package { $packages:
        ensure  => latest,
    }
}