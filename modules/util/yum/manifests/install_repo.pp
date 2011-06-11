define yum::install_repo ($rpm, $repoName = $name, $path = '') {
    include defaults

    if $path != '' {
        $executePath = $path
    } else {
        $executePath = $defaults::path
    }

    exec {
		"${repoName}-install":
        	command => "rpm -Uvh ${rpm}",
        	unless  => "yum --enablerepo=${repoName} repolist ${repoName} | grep ^${repoName}",
        	path    => "${excutePath}",
    }
}
