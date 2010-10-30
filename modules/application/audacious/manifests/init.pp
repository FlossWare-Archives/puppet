class audacious {
    $packages = [ 
        "audacious",
        "audacious-plugins-freeworld*",
    ]   

    package { $packages:
        ensure  => latest,
    }   
}

