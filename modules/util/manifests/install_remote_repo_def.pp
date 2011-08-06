define util::install_remote_repo_def ($remoteRpm, $repoName = $name, $path = undef) {
    include defaults

    if $path {
        $executePath = $path
    } else {
        $executePath = $defaults::path
    }

    $tmpRpm   = "/tmp/${repoName}.rpm"
    $execName = "${repoName}-install" 

    exec { 
        $execName:
            command => "wget ${remoteRpm} -O ${tmpRpm} ; rpm -Uvh ${tmpRpm}",
            unless  => "yum repolist | grep ^${repoName}",
            path    => $executePath,
    }
}
