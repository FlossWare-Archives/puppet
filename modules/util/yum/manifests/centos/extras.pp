class yum::centos::extras {
    yum::enable_repo { extras: repoName => "extras" }
}
