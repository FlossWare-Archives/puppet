class containerone {
    class { 'tocontain':
        name    => 'containeroneName',
        title   => 'containeroneTitle',
        message => 'In container ONE',
    }
}
