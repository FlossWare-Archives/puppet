class util::enable_repos ($repoNames) {
    notice ( "Enabling [${repoNames}]" )

    util::enable_repo_def {
        $repoNames:
    }
}
