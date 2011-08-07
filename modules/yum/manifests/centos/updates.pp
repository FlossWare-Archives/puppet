# This class ensure the CentOS updates repo is enabled.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::updates {
    util::enable_repo_def {
        'updates':
            repoName => 'updates',
    }
}
