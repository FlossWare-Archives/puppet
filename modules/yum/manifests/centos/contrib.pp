class yum::centos::contrib {
    util::enable_repo_def {
        'contrib':
            repoName => 'contrib',
    }
}
