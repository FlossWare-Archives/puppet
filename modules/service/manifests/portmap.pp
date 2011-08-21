class service::portmap {
    case $operatingsystem {
        CentOS: {
            case $operatingsystemrelease {
                5.6: {
                    $packageName = "portmap"
                    $serviceName = "portmap"
                }

                default: {
                    $packageName = "portreserve"
                    $serviceName = "portreserve"
                }
            }
        }

        Fedora: {
            $packageName = "portreserve"
            $serviceName = "portreserve"
        }
    }

    util::enable_service_def {
        "service::portmap":
            service  => $serviceName,
            packages => $packageName,
    }
}
