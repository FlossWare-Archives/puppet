class yum::fedora::rpmfusion {
	util::install_remote_repo_def {
		'fedora-rpmfusion-free':
			repoName => 'rpmfusion-free-updates',
			rpm      => 'http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm',
	}

	util::install_remote_repo_def {
		'fedora-rpmfusion-nonfree':
			repoName => 'rpmfusion-nonfree-updates',
			rpm      => 'http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm',
	}
}
