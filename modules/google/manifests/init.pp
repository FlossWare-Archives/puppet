class google::chrome {
	case $operatingsystem {
		Fedora: {
            $packages = [
                "google-chrome-stable",
            ]

			package { $packages:
				ensure => latest,
			}
		}
	}

    include adobe
}

class google {
    include google::chrome
}
