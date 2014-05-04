class containertwo {
    class { 'tocontain':
        name    => 'containertwoName',
        title   => 'containertwoTitle',
        message => 'In container TWO',
    }
}
