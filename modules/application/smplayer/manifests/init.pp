class smplayer {
    $packages = [
        "smplayer",
    ]

	package { $packages:
		ensure => latest,
	}
}

