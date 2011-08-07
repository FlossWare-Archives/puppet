# This class ensure the CentOS contrib repo is enabled.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::centos::contrib {
    util::enable_repo_def {
        'contrib':
            repoName => 'contrib',
    }
}
