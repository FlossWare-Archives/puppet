# This class ensure the CentOS extras repo is enabled.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::extras {
    util::enable_repo_def {
        'extras':
            repoName => 'extras',
    }
}
