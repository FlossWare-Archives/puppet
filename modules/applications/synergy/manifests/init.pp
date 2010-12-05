class synergy {
    $packages = [
        "synergy-plus",
    ]

	package { $packages:
		ensure => latest,
	}
}
