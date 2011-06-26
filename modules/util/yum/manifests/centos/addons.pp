class yum::centos::addons {
    yum::enable_repo {
        'addons':
            repoName => 'addons',
    }
}
