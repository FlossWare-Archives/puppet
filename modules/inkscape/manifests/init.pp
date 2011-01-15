class inkscape {
    $packages = [
        "inkscape",
    ]

    package { $packages:
        ensure  => latest,
    }
}

class inkscape::development inherits inkscape {
    $packages = [
        "gc-devel", "gtkmm24-devel", "libgnomeprintui22-devel",
        "python-devellcms-devel", "gsl-devel", "intltool", "lcms-devel"
        "lcms2-devel", "boost-devel"
    ]

    package { $packages:
        ensure  => latest,
    }
}

