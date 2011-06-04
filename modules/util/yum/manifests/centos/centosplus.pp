class yum::centos::centosplus {
    yum::enable_repo {
        'centosplus':
            repoName => "centosplus",
    }
}
