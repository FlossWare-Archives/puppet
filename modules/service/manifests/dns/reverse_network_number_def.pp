define service::dns::reverse_network_number_def () {
    file {
        '/etc/named':
            ensure => directory,
            owner  => 'named',
            group  => 'named',
    }

    file {
        "/etc/named/${name}":
            content => template ( 'service/dns/named/reverse_network_number.in-addr.arpa.erb' ),
            owner   => 'named',
            group   => 'named',
            notify  => service [ 'named' ],
    }
}
