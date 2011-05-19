class sysadmin::dhcp::variables {
    $default_dhcp_server = ${sysadmin::variables::adminserver_ip}
    $default_min_ip      = '192.168.168.50'
    $default_max_ip      = '192.168.168.250'

    $dhcp_identifier = $dhcp_identifier ? { 
	''      => ${default_dhcp_server}
	default => $dhcp_server
	}   

    $dhcp_server = $dhcp_server ? { 
	''      => ${default_dhcp_server}
	default => $dhcp_server
	}   

    $min_ip = $min_ip ? { 
	''      => $default_min_ip
	default => $min_ip
	}   

    $max_ip = $max_ip ? { 
	''      => $default_max_ip
	default => $max_ip
	}   
}

class sysadmin::dhcp::server {
    package { "dhcp":
        ensure => installed,
    }

    service { "dhcpd":
        ensure  => running,
        enable  => true,
    }

    case $operatingsystem {
        CentOS: {
	    file { "/etc/dhcpd.conf":
		content => template ( "sysadmin/dhcp/dhcpd.erb" ),
		notify  => Service  [ "dhcpd" ],
	    }
        }

        Fedora: {
	    file { "/etc/dhcp/dhcpd.conf":
		content => template ( "sysadmin/dhcp/dhcpd.erb" ),
		notify  => Service  [ "dhcpd" ],
	    }
        }
    }
}
