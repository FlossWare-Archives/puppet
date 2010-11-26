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

class xmms::development {
    include automake
    include autoconf
    include gcc
    include glibc::develpment
    include gtk::develpment
}

