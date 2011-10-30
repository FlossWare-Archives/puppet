# Enables the cobblerd service.
#   
# == Parameters
#   
# == Variables
#   
# [*$packages*]
#     All the packages needed for the cobblerd service.
#   
# == Examples
#   
# == Authors
#   
# Scot P. Floess <flossware@gmail.com>
#
class service::cobblerd {
    include service::httpd

    $packages = [
        "cobbler",
        "cobbler-web",
        "koan",
        "yum-utils",
    ]

    util::enable_service_def {
        'service::cobblerd':
            service  => 'cobblerd',
            packages => $packages,
            notify   => Service [ 'httpd' ],
    }
}
