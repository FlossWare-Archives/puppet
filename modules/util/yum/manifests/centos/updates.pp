class yum::centos::updates {
    yum::enable_repo {
        'updates':
            repoName => "updates",
    }
}
