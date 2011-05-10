define enable_repo ($repoName = "$name") {
    exec { "$repoName-enable":
	command => "yum --enablerepo=${repoName} repolist ${repoName}",
	path    => ["/usr/bin", "/bin"],
    }
}

define install_repo ($repoName, $rpm) {
    exec { "$repoName-install":
	command => "rpm -Uvh --nogpgcheck install ${rpm}",
	unless  => "yum --enablerepo=${repoName} repolist ${repoName} | grep ^${repoName}",
	path    => ["/usr/bin", "/bin"],
    }
}

class yum::centos::addons {
    enable_repo { addons: repoName => "addons" }
}

class yum::centos::centosplus {
    enable_repo { centosplus: repoName => "addons" }
}

class yum::centos::contrib {
    enable_repo { contrib: repoName => "contrib" }
}

class yum::centos::extras {
    enable_repo { extras: repoName => "extras" }
}

class yum::centos::updates {
    enable_repo { updates: repoName => "updates" }
}


class yum::centos::epel {
    yumrepo {
	epel:
            name         => "epel",
	    mirrorlist   => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-${lsbmajdistrelease}&arch=${architecture}",
	    enabled      => "1",
	    enablegroups => "1",
	    gpgcheck     => "0",
    }
}

class yum::centos::rpmforge {
    case $lsbmajdistrelease {
	5: {
	    case $architecture {
		x86_64: {
		    $RPM = "http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm"
		}

		default: {
		    $RPM = "http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.i386.rpm"
		}
	    }

	    install_repo {
		centos-5-rpmforge:
		    repoName => "rpmforge",
		    rpm      => "${RPM}",
	    }
	}

	6: {
	    case $architecture {
		x86_64: {
		    $RPM = "http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm"
		}

		default: {
		    $RPM = "http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.i686.rpm"
		}
	    }

	    install_repo {
		centos6-rpmforge:
		    repoName => "rpmforge",
		    rpm      => "${RPM}",
	    }
	}
    }
}

class yum::centos::rpmfusion {
    case $lsbmajdistrelease {
	5: {
	    install_repo {
		centos-5-rpmfusion-free:
		    repoName => "rpmfusion-free",
		    rpm      => "http://download1.rpmfusion.org/free/el/updates/testing/${lsbmajdistrelease}/${architecture}/rpmfusion-free-release-5-0.1.noarch.rpm",
	    }

	    install_repo {
		centos-5-rpmfusion-nonfree:
		    repoName => "rpmfusion-nonfree",
		    rpm      => "http://download1.rpmfusion.org/nonfree/el/updates/testing/${lsbmajdistrelease}/${architecture}/rpmfusion-nonfree-release-5-0.1.noarch.rpm",
	    }
	}
    }
}


class yum::fedora::everything {
    yumrepo {
	fedora-everything:
	    #baseurl      => "http://download.fedora.redhat.com/pub/fedora/linux/releases/$lsbdistrelease/Everything/$hardwaremodel/os",
            name         => "fedora-everything",
	    mirrorlist   => "http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-${operatingsystemrelease}&arch=${architecture}",
	    enabled      => "1",
	    enablegroups => "1",
	    gpgcheck     => "0",
    }
}

class yum::fedora::updates {
    yumrepo {
	fedora-updates:
	    #baseurl      => "http://download.fedora.redhat.com/pub/fedora/linux/releases/$lsbdistrelease/Everything/$hardwaremodel/os",
            name         => "fedora-updates",
	    mirrorlist   => "http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f${operatingsystemrelease}&arch=${architecture}",
	    enabled      => "1",
	    enablegroups => "1",
	    gpgcheck     => "0",
    }
}

class yum::fedora::rpmfusion {
    case $lsbmajdistrelease {
	15 : {
	    install_repo {
		fedora-15-rpmfusion-free:
		    repoName => "rpmfusion-free",
		    rpm      => "http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-rawhide.noarch.rpm",
		}

	    install_repo {
		fedora-15-rpmfusion-nonfree:
		    repoName => "rpmfusion-free",
		    rpm      => "http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-rawhide.noarch.rpm",
	    }
	}

	default: {
	    install_repo {
		fedora-rpmfusion-free:
		    repoName => "rpmfusion-free",
		    rpm      => "http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm",
	    }

	    install_repo {
		fedora-rpmfusion-nonfree:
		    repoName => "rpmfusion-nonfree",
		    rpm      => "http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm",
	    }
	}
    }
}


class yum::centos {
    include yum::centos::addons
    include yum::centos::centosplus
    include yum::centos::contrib
    include yum::centos::extras
    include yum::centos::updates
    include yum::centos::epel
    include yum::centos::rpmforge
    include yum::centos::rpmfusion
}

class yum::fedora {
    include yum::fedora::everything
    include yum::fedora::updates
}

class yum {
    /*
       lsbdistrelease => 5.6
       lsbmajdistrelease => 5
     */

    case $operatingsystem {
	CentOS: {
	    include yum::centos
	}

	Fedora: {
	    include yum::fedora
	}
    }

    yumrepo {
	"${operatingsystem}-${operatingsystemrelease}-flossware-${architecture}":
            name         => "flossware",
	    baseurl      => "http://adminserver:80/cobbler/repo_mirror/${operatingsystem}-${operatingsystemrelease}-flossware-${architecture}",
	    enabled      => "1",
	    enablegroups => "1",
	    gpgcheck     => "0",
    }
}
