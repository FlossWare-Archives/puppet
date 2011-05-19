define yum::enable_repo ($repoName = "$name") {
    exec { "$repoName-enable":
	command => "yum --enablerepo=${repoName} repolist ${repoName}",
	path    => ["/usr/bin", "/bin"],
    }
}

