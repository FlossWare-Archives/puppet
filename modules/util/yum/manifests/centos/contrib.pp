class yum::centos::contrib {
    yum::enable_repo {
        'contrib':
            repoName => 'contrib',
    }
}
