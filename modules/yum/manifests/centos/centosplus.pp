class yum::centos::centosplus {
    util::enable_repo_def {
        'centosplus':
            repoName => 'centosplus',
    }
}
