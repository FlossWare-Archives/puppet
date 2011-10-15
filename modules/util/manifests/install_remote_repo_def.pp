# Downloads a remote repo definition and installs it.  If its already been
# downloaded and installed, nothing is done.
#
# == Parameters
#
# [*$remoteRpm*]
#     The URL to the remote RPM repo definition to download and install.
#
# [*$repoName*]
#     A name for the remote repo.  When downloading, the name of the RPM for the download.
#
# [*$path*]
#     The executable path to use when determining if the RPM was already installed.
#
# == Variables
#
# [*$executePath*]
#     The executable path to use when determining if the RPM was already installed.
#
# [*$tmpRpm*]
#     When downloading the remote RPM, the absolute path and file name for downloading the RPM.
#     Will also use this file for installing the RPM.
#
# [*$execName*]
#     The name of the exec task.
#
# == Examples
#
#    util::install_remote_repo_def {
#        'rpmfusion-free':
#            remoteRpm => 'http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm',
#            repoName  => 'free-rpmfusion',
#            path      => [ '/usr/bin', '/bin', '/sbin' ],
#    }
#
#    util::install_remote_repo_def {
#        'rpmfusion-free':
#            remoteRpm => 'http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm',
#    }
#
# == Authors
#
#     Scot P. Floess <flossware@gmail.com>
#
define util::install_remote_repo_def ( $remoteRpm, $repoName = $name, $path = undef ) {
    include defaults

    if $path {
        $executePath = $path
    } else {
        $executePath = $defaults::path
    }

    $tmpRpm   = "/tmp/${repoName}.rpm"
    $execName = "util::install_remote_repo_def::exec::${repoName}_install" 

    exec { 
        $execName:
            command => "wget ${remoteRpm} -O ${tmpRpm} ; rpm -Uvh ${tmpRpm}",
            unless  => "yum repolist | grep ^${repoName}",
            path    => $executePath,
    }
}
