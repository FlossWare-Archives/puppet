define util::enable_repo_def ($repoName = $name, $path = undef) {
    include defaults
    notice ( "Enabling [${repoName}]" )

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
