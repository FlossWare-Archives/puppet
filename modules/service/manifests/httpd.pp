# Enables the httpd service.
#   
# == Parameters
#   
# == Variables
#   
# [*$packages*]
#     All the packages needed for the httpd service.
#   
# == Examples
#   
# == Authors
#   
# Scot P. Floess <flossware@gmail.com>
#   
class service::httpd {
    $packages = [
        "httpd",
    ]

    util::enable_service_def {
        'service::httpd':
            service  => 'httpd',
            packages => $packages,
    }
}
