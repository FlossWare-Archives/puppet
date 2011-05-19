class mozilla::firefox {
    $packages = [
        "firefox",
    ]

	package { $packages:
		ensure => latest,
	}
}

class mozilla::seamonkey {
    $packages = [
        "seamonkey",
    ]

	package { $packages:
		ensure => latest,
	}
}

class mozilla::thunderbird {
    $packages = [
        "thunderbird",
    ]

	package { $packages:
		ensure => latest,
	}
}

class mozilla {
    include mozilla::firefox
    include mozilla::seamonkey
    include mozilla::thunderbird
}
