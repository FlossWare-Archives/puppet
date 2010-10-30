class squirrel-sql {
    $packages = [
        "squirrel-sql",
    ]

    package { $packages:
        ensure => latest,
    }

    include sun::java
}

