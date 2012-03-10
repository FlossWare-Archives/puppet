# This class ensure the CentOS extras repo is enabled.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::extras {
    yum::centos::centos_repo_def {
        'extras':
            repo => 'extras',
    }
}
