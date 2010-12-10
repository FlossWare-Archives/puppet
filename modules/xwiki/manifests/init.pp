class xwiki {
    $packages = [ 
        "xwiki",
    ]   

    package { $packages:
        ensure  => latest,
    }   
}

