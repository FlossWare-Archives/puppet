# This class ensure the CentOS contrib repo is enabled.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::contrib {
    yum::centos::centos_repo_def {
        'contrib':
            repo => 'contrib',
    }
}
