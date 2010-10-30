class alpine {
    case $operatingsystem {
        Fedora: {
            include hunspell
        }

        CentOS: {
            include aspell
        }
    }

    $packages = [
        "alpine",
    ]

    package { $packages:
        ensure => latest,
    }
}
