class apache::ant {
    $packages = [ 
        "apache-ant",
    ]   

    package { $packages:
        ensure => latest,
    }   

    include sun::java
}

