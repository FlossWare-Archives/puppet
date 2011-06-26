class yum::fedora::rpmfusion {
	yum::install_repo {
		'fedora-rpmfusion-free':
			repoName => 'rpmfusion-free-updates',
			rpm      => 'http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm',
	}

	yum::install_repo {
		'fedora-rpmfusion-nonfree':
			repoName => 'rpmfusion-nonfree-updates',
			rpm      => 'http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm',
	}
}
