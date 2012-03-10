# This class ensure the CentOS updates repo is enabled.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::updates {
    yum::centos::centos_repo_def {
        'updates':
            repo => 'updates',
    }
}
