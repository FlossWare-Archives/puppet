class vi::enhanced {
    $packages = [
        "vim-enhanced"
    ]

    package { $packages:
        ensure => latest,
    }

    file { "/etc/vimrc":
        source => "puppet:///modules/vi/vim.conf"
    }
}

class vi::X11 {
    $packages = [
        "vim-X11",
    ]

    package { $packages:
        ensure => latest,
    }

    file { "/etc/gvimrc":
        source => "puppet:///modules/vi/gvim.conf"
    }
}

class vi {
	include vi::enhanced
	include vi::X11
}
