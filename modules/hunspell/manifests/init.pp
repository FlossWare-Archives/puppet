class hunspell {
    $packages = [
        "hunspell",
        "hunspell-en",
    ]

    package { $packages:
        ensure => latest,
    }
}
