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
class services::cobblerd {
    $packages = [
        "yum-utils",
        "cobbler",
        "cobbler-web",
    ]

    util::enable_service_def {
        'services::cobblerd::service':
            service  => 'httpd',
            packages => $packages,
    }

    include services::httpd
}
