define yum::install_repo ($repoName, $rpm) {
    exec { "${repoName}-install":
        command => "rpm -Uvh ${rpm}",
        unless  => "yum --enablerepo=${repoName} repolist ${repoName} | grep ^${repoName}",
        path    => "/usr/bin:/bin",
    }
}
