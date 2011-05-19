class profile::variables {
    $default_internal_domain  = 'flossware.com'
    $default_external_domain  = 'flossware.homelinux.org'
    $default_adminserver_host = 'adminserver'
    $default_adminserver_ip   = '192.168.168.253'
    $default_gateway_ip       = '192.168.168.1'

    $adminserver_host = $adminserver_host ? {
        ''      => ${default_adminserver_host},
        default => ${adminserver_host}
        }

    $adminserver_fqdn = ${adminserver_host}.${default_internal_domain}

    $adminserver_ip = $adminserver_ip ? {
        ''      => ${default_adminserver_ip},
        default => ${adminserver_ip}
        }

    $internal_domain = $internal_domain ? {
        ''      => ${default_internal_domain},
        default => ${internal_domain}
        }
}

class profile::base {
	include crond
	include portmap
	include ssh
	include syslog
}
