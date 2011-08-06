class yum::centos::extras {
    util::enable_repo_def {
        'extras':
            repoName => 'extras',
    }
}
