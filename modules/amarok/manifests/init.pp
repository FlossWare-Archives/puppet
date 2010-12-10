class amarok {
    $packages = [
        "amarok",
        "xine-lib-extras-freeworld",
    ]

    package { $packages:
        ensure  => latest,
    }   
}

