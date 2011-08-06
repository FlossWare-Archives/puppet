class yum::centos::addons {
    util::enable_repo_def {
        'addons':
            repoName => 'addons',
    }
}
