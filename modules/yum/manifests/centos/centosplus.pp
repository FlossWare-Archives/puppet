# This class ensures the CentOS centosplus repo is enabled.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::centosplus {
    util::enable_repo_def {
        'centosplus':
            repoName => 'centosplus',
    }
}
