class tigris::argouml {
    $packages = [ 
        "argouml",
    ]   

    package { $packages:
        ensure => latest,
    }   

    include sun::java
}

class tigris::subversion {
    $packages = [
        "subversion",
    ]

    package { $packages:
        ensure => latest,
    }
}

class tigris {
    include tigris::argouml
    include tigris::subversion
}

