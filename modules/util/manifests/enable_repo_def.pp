# This will enable a repo that is denoted within a yum repo file.
#
# == Parameters
#
# [*repoName*]
#     The name of the repo to enable.
#
# [*path*]
#     An alternate executable path to use when ensuring the repo is present to enable.
#
# == Variables
#
# [*executePath*]
#     The executable path to use when ensuring the repo is present for enabling.
#
# [*enableRepoName*]
#     The name used when calling exec.  When the repo is added, will also be used to
#     subscribe enabling the yum repo and enabling it.
#
# == Examples
#
#    util::enable_repo_def {
#        'centosplus':
#            repoName => 'centosplus',
#            path     => [ '/sbin', '/usr/bin' ],
#    }
#
#    util::enable_repo_def {
#        'centosplus':
#    }
#
# == Authors
#
#     Scot P. Floess <flossware@gmail.com>
#
define util::enable_repo_def ($repoName = $name, $path = undef) {
    include defaults

    if $path {
        $executePath = $path
    } else {
        $executePath = $defaults::path
    }

    $enableRepoName = "util::enable_repo_def::exec_${name}_${repoName}"

    exec {
        $enableRepoName:
            unless => "yum --enablerepo=${repoName} repolist ${repoName}",
            path   => $executePath,
    }   

    yumrepo {
        $repoName:
            enabled => 1,

        subscribe => Exec [ $enableRepoName ],
    }
}
