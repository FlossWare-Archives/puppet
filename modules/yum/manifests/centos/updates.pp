class yum::centos::updates {
    util::enable_repo_def {
        'updates':
            repoName => 'updates',
    }
}
