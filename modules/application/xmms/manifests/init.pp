class xmms {
    $packages = [ 
        "xmms",
        "xmms-mp3",
        "xmms-faad2",
        "xmms-pulse",
        "xmms-skins",
    ]   

    package { $packages:
        ensure  => latest,
    }   
}

