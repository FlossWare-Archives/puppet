define yum::enable_repo ($repoName = $name, $path = '') {
    include defaults

    if $path != '' {
        $executePath = $path
    } else {
        $executePath = $defaults::path
    }

    exec {
		"${repoName}-enable":
			command => "yum --enablerepo=${repoName} repolist ${repoName}",
			path    => "${executePath}",
    }
}
