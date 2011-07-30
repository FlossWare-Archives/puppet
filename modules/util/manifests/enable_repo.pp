define util::enable_repo ($repoName = $name, $path = '') {
    include defaults

    if $path {
        $executePath = $path
    } else {
        $executePath = $defaults::path
    }

    $enableRepoName = "${repoName}-enable"

    exec {
        $enableRepoName:
            unless => "yum --enablerepo=${repoName} repolist ${repoName}",
            path   => $executePath,
    }   

    yumrepo {
        $repoName:
            enabled => 1,

        subscribe => Exec [ $enableRepoName ],
    }
}
