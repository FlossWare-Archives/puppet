class freemind {
    $packages = [
        "freemind",
    ]

    package { $packages:
        ensure => latest,
    }

    include sun::java
}
