include common

class xfce ($timeout = "${common::execTimeout}") {
	include xwindows
	include desktop

    exec { "XFCE Dependencies":
        command    => "/usr/bin/yum groupinstall -y XFCE",
        cwd        => "/",
        timeout    => "${timeout}",
        unless     => "which startxfce4",
        path       => "/usr/bin:/usr/sbin:/bin",
    }   
}