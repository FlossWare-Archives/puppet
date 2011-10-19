class service::ntp ( $server, $minpoll, $maxpoll, $broadcast = undef ) {
    util::enable_service_def {
        'service::ntp::service':
            service  => 'ntpd',
            packages => 'ntp',
    }

    service {
        'ntpdate':
            enable => true,
    }

    file {
        '/etc/ntp.conf':
            content => template ( 'service/ntp/ntp.conf' ),
            notify  => Service [ 'ntpd' ]
    }
}
