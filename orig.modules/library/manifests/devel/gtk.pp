class library::gtk::development {
    $packages = [
        "gtk+-devel",
    ]

    package { $packages:
        ensure => latest,
    }
}
