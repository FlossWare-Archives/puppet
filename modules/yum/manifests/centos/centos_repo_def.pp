# Defines how to setup a centos yum repo.
#
# == Parameters
#
# [*$repo*]
#     The name of a repo.
#
# [*$enabled*]
#     Flag, if 1 or true will enable the yum repo.
#
# [*$enabled_groups*]
#     Flag, if 1 or true will enabled package groups.
#
# == Variables
#
# [*$repoName*]
#     Becomes centos-${repo}
#
# == Examples
#
#    yum::centos::centos_repo_def {
#        'centosplus':
#            repo => 'centosplus',
#            enabled => '1',
#            enable_groups => '1',
#    }
#
#    yum::centos::centos_repo_def {
#        'centosplus':
#    }
#
# == Authors
#
#     Scot P. Floess <flossware@gmail.com>
#
define util::install_group_def ( $repo = $name, $enabled = "1", $enabled_groups = "1" ) {
    $repoName = "centos-${name}"

    yumrepo {
        "${repoName}":
            enabled      => "${enabled}",
            enablegroups => "${enabled_groups}",
            mirrorlist   => "http://mirrorlist.centos.org/?release=${lsbdistrelease}&arch=${architecture}&repo=${repo}",
            name         => "${repoName}",
    }
}
