# This class ensures the CentOS centosplus repo is enabled.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::centosplus {
    yum::centos::centos_repo_def {
        'centosplus':
            repo => 'centosplus',
    }
}
