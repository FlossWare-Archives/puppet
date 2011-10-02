# This class will enable repos.
#
# == Parameters
#
# [*repoName*]
#     The name of the repo to enable.
#
# == Examples
#
#    util::enable_repos {
#        'mycentosplus':
#            repoNames => 'centosplus',
#    }
#
#    util::enable_repos {
#        repoNames => ['centosplus','contrib'],
#    }
#
# == Authors
#
#     Scot P. Floess <flossware@gmail.com>
#
class util::enable_repos ( $repoNames ) {
    util::enable_repo_def {
        "util::enable_repos::${repoNames}":
            repoName => $repoNames,
    }
}
