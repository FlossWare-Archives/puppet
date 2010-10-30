class sun::java {
    $packages = [
        "jdk",
    ]

    package { $packages:
        ensure => latest,
    }
}

class sun {
    include sun::java
}
