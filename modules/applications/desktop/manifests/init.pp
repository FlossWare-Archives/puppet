include defaults

define desktop ($group, $unless, $timeout = "${defaults::timeout}", $path = "${defaults::path}") {
    exec {
        command    => "/usr/bin/yum groupinstall -y ${group}",
        cwd        => "/",
        timeout    => ${timeout},
        unless     => "which ${unless}",
        path       => $path,
    }   
}