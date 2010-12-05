class totem {
    $packages = [
        "totem",
    ]

	package { $packages:
		ensure => latest,
	}
}
