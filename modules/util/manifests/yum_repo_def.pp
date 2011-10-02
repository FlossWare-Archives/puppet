# Allows one to enable/disable a repo that is denoted within a yum repo file.
#
# Please note:  tried to use yumrepo but it does not seem to honor subscribe/notify
#               and therefore had to use exec to do all the work.
#
# == Parameters
#
# [*repoName*]
#     The name of the repo to enable/disable.
#
# [*path*]
#     An alternate executable path to use when ensuring the repo is present to enable.
#
# == Variables
#
# [*executePath*]
#     The executable path to use when ensuring the repo is present for enabling/disabling.
#
# [*execName*]
#     The name used when calling exec.
#
# == Examples
#
#    util::yum_repo_def {
#        'centosplus':
#            isEnabled => '1',
#            repoName  => 'centosplus',
#            path      => [ '/sbin', '/usr/bin' ],
#    }
#
#    util::enable_repo_def {
#        'centosplus':
#            isEnabled => '0',
#    }
#
# == Authors
#
#     Scot P. Floess <flossware@gmail.com>
#
define util::yum_repo_def ($isEnabled, $repoName = $name, $path = undef) {
    include defaults

    if $path {
        $executePath = $path
    } else {
        $executePath = $defaults::path
    }

    $execName = "util::yum_repo_def::exec_${name}_${repoName}"

    exec {
        $execName:
            command => "sed -i -e \"s/\\(\\(enabled\\s*=\\)\\s*\\).*/\\1${isEnabled}/\" /etc/yum.repos.d/${repoName}.repo",
            onlyif  => "yum --enablerepo=${repoName} repolist ${repoName}",
            path    => $executePath,
    }   
}
