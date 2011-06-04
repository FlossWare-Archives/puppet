include defaults

define yum::install_repo ($rpm, $repoName = $name, $path = $defaults::path) {
    exec {
		"${repoName}-install":
        	command => "rpm -Uvh ${rpm}",
        	unless  => "yum --enablerepo=${repoName} repolist ${repoName} | grep ^${repoName}",
        	path    => "${path}",
    }
}