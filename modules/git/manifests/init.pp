class git {
    $packages = [
        "git",
    ]

    package { $packages:
        ensure => latest,
    }
}

