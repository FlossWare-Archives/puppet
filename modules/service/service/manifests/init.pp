/*
    Class: service

    This idea behind this class is to act as the base class for all services.  It utilizes
    the empty class +defaults+ for default values.  If a default value is not found, all
    attempts are made to define a "good enough" default value.

    Variables contained here can be utilized either from a generic perspective or are defined
    when 2 or more classes use said variable (thereby computing and storing the variable in one
    class).  Overriding values for these variables can either be done in yaml or by defining a
    default value for the variable.

    Default values are searched in the +defaults+ class.  If not found, a "good enough" default
    is defined.  Variables are then set, first examining if the variable is defined and if so
    that value is used.  Otherwise, the default value is used.

    Variables for this class, as well as all service inherited classes should follow the following
    naming convention:
        - default variables:  [class name]_default[MeaningfulVariableName in upper camel case].
                              service_defaultNetmask

        - variable:  [class name]_[meaningfulVariableName in lower camel case].
                     service_netmask

    Parameters:
        service_netmask:
            The netmask for the network - for example 255.255.255.0

        service_subnet:
            The subnet address for the network - for example 192.168.168.0

        service_baseIp:
            The base ip for the network - for example 192.168.168

        service_reverseBaseIp:
            The reverse base ip (octets in reverse order of service_baseIp) - for example 168.168.192

        service_broadcastAddress:

        service_internalDomain:

        service_externalDomain:

        service_mainServerHost:

        service_mainServerIp:

        service_mainServerFqdn:

        service_gatewayIp:
*/
class service {
    include defaults

    # ------------------------------------------------------------
    # Using the defaults class, attempt to use default values
    # contained there.  If a default is not found, use a "good enough"
    # value.
    # ------------------------------------------------------------

    $service_defaultNetmask = $defaults::service_netmask ? {
        ''      => $netmask_eth0,
        default => $defaults::service_netmask,
    }

    $service_defaultSubnet = $defaults::service_subnet ? {
        ''      => $network_eth0,
        default => $defaults::service_subnet,
    }

    $service_defaultBaseIp = $defaults::service_baseIp ? {
        ''      => template ( "service/BaseIp.erb" ),
        default => $defaults::service_baseIp,
    }

    $service_defaultReverseBaseIp = $defaults::service_reverseBaseIp ? {
        ''      => template ( "service/ReverseBaseIp.erb" ),
        default => $defaults::service_reverseBaseIp,
    }

    $service_defaultsBroadcastAddress = $defaults::service_broadcastAddress ? {
        ''      => "{service_defaultBaseIp}.255",
        default => $defaults::service_broadcastAddress,
    }

    $service_defaultInternalDomain = $defaults::service_internalDomain ? {
        ''      => $domain,
        default => $defaults::service_internalDomain,
    }

    $service_defaultExternalDomain = $defaults::service_externalDomain ? {
        ''      => $domain,
        default => $defaults::service_externalDomain,
    }

    $service_defaultMainServerHost = $defaults::service_mainServerHost ? {
        ''      => $hostname,
        default => $defaults::service_mainServerHost,
    }

    $service_defaultMainServerIp = $defaults::service_mainServerIp ? {
        ''      => $ipaddress,
        default => $defaults::service_mainServerIp,
    }

    $service_defaultMainServerFqdn = $defaults::service_mainServerFqdn ? {
        ''      => $fwdn,
        default => $defaults::service_mainServerFqdn, 
    }

    $service_defaultGatewayIp = $defaults::service_gatewayIp ? {
        ''      => $ipaddress,
        default => $defaults::service_gatewayIp, 
    }


    # ------------------------------------------------------------
    # Define service values.  If defined, use that value otherwise
    # use the default values computed above.
    # ------------------------------------------------------------

    $service_netmask = $service_netmask ? {
        ''      => $service_defaultNetmask,
        default => $service_netmask,
    }

    $service_subnet = $service_subnet ? {
        ''      => $service_defaultSubnet,
        default => $service_subnet,
    }

    $service_baseIp = $service_baseIp ? {
        ''      => $service_defaultBaseIp,
        default => $service_baseIp,
    }

    $service_reverseBaseIp = $service_reverseBaseIp ? {
        ''      => $service_defaultReverseBaseIp,
        default => $service_reverseBaseIp,
    }

    $service_broadcastAddress = $service_broadcastAddress ? {
        ''      => $service_defaultBroadcastAddress,
        default => $service_broadcastAddress,
    }

    $service_internalDomain = $service_internalDomain ? {
        ''      => $service_defaultInternalDomain,
        default => $service_internalDomain,
    }

    $service_externalDomain = $service_externalDomain ? {
        ''      => $service_defaultExternalDomain,
        default => $service_externalDomain,
    }

    $service_mainServerHost = $service_mainServerHost ? {
        ''      => $service_defaultMainServerHost,
        default => $service_mainServerHost,
    }

    $service_mainServerIp = $service_mainServerIp ? {
        ''      => $service_defaultMainServerIp,
        default => $service_mainServerIp,
    }

    $service_mainServerFqdn = $service_mainServerFqdn ? {
        ''      => $service_defaultMainServerFqdn
        default => $service_mainServerFqdn, 
    }

    $service_gatewayIp = $service_gatewayIp ? {
        ''      => $service_defaultGatewayIp,
        default => $service_gatewayIp, 
    }
}
