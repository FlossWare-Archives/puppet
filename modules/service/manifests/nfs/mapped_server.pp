class service::nfs::mapped_server ( $exportMap ) inherits service::nfs:base {
    util::enable_service_def {
        'nfs':
    }

    file { "/etc/exports":
        content => template ( "service/nfs/exports.erb" ),
        notify  => Service [ "nfs" ],
    }
}
