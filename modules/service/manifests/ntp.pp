# Class to manage the NTP service.
#   
# == Parameters
#   
# [*server*]
#   The server for whom the date/time will be retrieved.
#   
# [*minpoll*]
#   The minimum poll time.
#   
# [*maxpoll*]
#   The maximum poll time.
#   
# [*broadcast*]
#   The broadcast address to use if acting as a server.
#   
# == Variables
#   
# == Examples
#   
# == Authors
#   
# Scot P. Floess <flossware@gmail.com>
#   
class service::ntp ( $server, $minpoll, $maxpoll, $broadcast = undef ) {
    util::enable_service_def {
        'service::ntp::service':
            service  => 'ntpd',
            packages => 'ntp',
    }

    // Want to enable ntpdate if possible...
    case $::operatingsystem {
        CentOS: {
            case $::lsbmajdistrelease {
                5: {
                }

                default: {
                    service {
                        'ntpdate':
                            enable => true,
                    }
                }
            }
        }

        Fedora: {
            service {
                'ntpdate':
                    enable => true,
            }
        }
    }

    file {
        '/etc/ntp.conf':
            content => template ( 'service/ntp/ntp.conf' ),
            notify  => Service [ 'ntpd' ]
    }
}
