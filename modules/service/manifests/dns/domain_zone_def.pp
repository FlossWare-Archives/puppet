define service::dns::domain_zone_def() {
    file {
        '/etc/named':
            ensure => directory,
            owner  => 'named',
            group  => 'named',
    }

    file {
        "/etc/named/${name}":
            content => template ( 'service/dns/named/domain.erb' ),
            owner   => 'named',
            group   => 'named',
            notify  => service [ 'named' ],
    }
}
