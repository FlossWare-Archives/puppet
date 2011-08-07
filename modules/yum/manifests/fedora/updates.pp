# This class will enable the Fedora updates repo.
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class yum::fedora::updates {
    yumrepo {
        'fedora-updates':
            name         => 'fedora-updates',
            mirrorlist   => "http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f${operatingsystemrelease}&arch=${architecture}",
            enabled      => '1',
            enablegroups => '1',
            gpgcheck     => '0',
    }
}
