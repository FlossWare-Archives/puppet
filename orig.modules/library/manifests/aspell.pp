class library::aspell {
    $packages = [
        "aspell",
    ]

    package { $packages:
        ensure => latest,
    }
}
