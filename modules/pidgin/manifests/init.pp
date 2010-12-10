class pidgin::finch {
    $packages = [
        "finch",
    ]

    package { $packages:
        ensure => latest,
    }
}

class pidgin::pidgin {
    $packages = [
        "pidgin",
    ]

    package { $packages:
        ensure => latest,
    }
}

class pidgin {
    include pidgin::finch
    include pidgin::pidgin
}
