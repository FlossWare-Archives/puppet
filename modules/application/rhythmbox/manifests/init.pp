class rhythmbox {
    $packages = [ 
        "rhythmbox",
        "gstreamer-plugins-ugly",
        "gstreamer-plugins-bad",
        "gstreamer-ffmpeg",
    ]   

    package { $packages:
        ensure  => latest,
    }   
}

