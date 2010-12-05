class aspell {
    $packages = [
        "aspell",
    ]

    package { $packages:
        ensure => latest,
    }
}
