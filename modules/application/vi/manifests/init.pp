class vi::enhanced {
    $packages = [
        "vim-enhanced"
    ]

    package { $packages:
        ensure => latest,
    }
}

class vi::X11 {
    $packages = [
        "vim-X11",
    ]

    package { $packages:
        ensure => latest,
    }
}

class vi {
	include vi::enhanced
	include vi::X11
}
