class yum {
    case $::operatingsystem {
        CentOS: {
            include yum::centos
        }

        Fedora: {
            include yum::fedora
        }
    }
}