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

        service_masterHost:

        service_masterHostIp:

        service_masterHostFqdn:

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

    $service_defaultMasterHost = $defaults::service_masterHost ? {
        ''      => $hostname,
        default => $defaults::service_masterHost,
    }

    $service_defaultMasterIp = $defaults::service_masterIp ? {
        ''      => $ipaddress,
        default => $defaults::service_masterIp,
    }

    $service_defaultMasterFqdn = $defaults::service_masterFqdn ? {
        ''      => $fwdn,
        default => $defaults::service_masterFqdn, 
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

    $service_masterHost = $service_masterHost ? {
        ''      => $service_defaultMasterHost,
        default => $service_masterHost,
    }

    $service_masterIp = $service_masterIp ? {
        ''      => $service_defaultMasterIp,
        default => $service_masterIp,
    }

    $service_masterFqdn = $service_masterFqdn ? {
        ''      => $service_defaultMasterFqdn
        default => $service_masterFqdn, 
    }

    $service_gatewayIp = $service_gatewayIp ? {
        ''      => $service_defaultGatewayIp,
        default => $service_gatewayIp, 
    }
}
