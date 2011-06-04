include defaults

define yum::enable_repo ($repoName = $name, $path = $defaults::path) {
    exec {
		"${repoName}-enable":
			command => "yum --enablerepo=${repoName} repolist ${repoName}",
			path    => "${path}",
    }
}