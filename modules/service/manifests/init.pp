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

        service_networkNumber:
            The network number for the network - for example in 192.168.168.253, the service_networkNumber is 192.168.168

        service_reverseNetworkNumber:
            The reverse network number (values in reverse order of service_networkNumber) - for example in 102.168.168.252, the service_reverseNetworkNumber is 168.168.192

        service_broadcastAddress:
            The broadcast address for things like DHCP and NTP - for example 192.168.168.0

        service_hostNumber:
            The host number (last octet in IP/Address) - for example in 192.168.168.253, the service_hostNumber is 253.

        service_internalDomain:
            The internal domain used - for example flossware.com

        service_externalDomain:
            The external domain used outside of this network - for example flossware.homelinux.org

        service_masterHost:
            The master server host name on this network.

        service_masterHostIp:
            The IP address of the master server on this network.

        service_masterHostFqdn:
            The fully qualified name of the master server on this network.

        service_gatewayIp:
            The IP address of the gateway on this network.
*/
class service {
    #
    # Use defaults if defined...
    #
    include defaults

    # ------------------------------------------------------------
    # Using the defaults class, attempt to use default values
    # contained there.  If a default is not found, use a "good enough"
    # value.
    # ------------------------------------------------------------

    $service_defaultNetmask = $defaults::service_defaultNetmask ? {
        ''      => $netmask_eth0,
        default => $defaults::service_defaultNetmask,
    }

    $service_defaultSubnet = $defaults::service_defaultSubnet ? {
        ''      => $network_eth0,
        default => $defaults::service_subnet,
    }

    #
    # The template ComputeNetworkNumber.erb uses the variable service_computeNetworkNumber
    # in computing the network number.
    #
    $service_computeNetworkNumber = $service_defaultSubnet

    $service_defaultNetworkNumber = $defaults::service_defaultNetworkNumber ? {
        ''      => template ( "service/ComputeNetworkNumber.erb" ),
        default => $defaults::service_defaultNetworkNumber,
    }

    #
    # The template ComputeReverseNetworkNumber.erb uses the variable service_computeReverseNetworkNumber
    # in computing the reverse network number.
    #
    $service_computeReverseNetworkNumber = $service_defaultSubnet

    $service_defaultReverseNetworkNumber = $defaults::service_defaultReverseNetworkNumber ? {
        ''      => template ( "service/ComputeReverseNetworkNumber.erb" ),
        default => $defaults::service_defaultReverseNetworkNumber,
    }

    $service_defaultsBroadcastAddress = $defaults::service_defaultBroadcastAddress ? {
        ''      => "{service_defaultBaseIp}.255",
        default => $defaults::service_defaultBroadcastAddress,
    }

    #
    # The template C.erb uses the variable service_ComputeHostNumber
    # in computing the host number...
    #
    $service_computeHostNumber = $ipaddress

    $service_defaultHostNumber = $defaults::service_defaultHostNumber ? {
        ''      => template ( "service/ComputeHostNumber.erb" ),
        default => $defaults::service_defaultHostNumber,
    }

    $service_defaultInternalDomain = $defaults::service_defaultInternalDomain ? {
        ''      => $domain,
        default => $defaults::service_defaultInternalDomain,
    }

    $service_defaultExternalDomain = $defaults::service_defaultExternalDomain ? {
        ''      => $domain,
        default => $defaults::service_defaultExternalDomain,
    }

    $service_defaultMasterHost = $defaults::service_defaultMasterHost ? {
        ''      => $hostname,
        default => $defaults::service_defaultMasterHost,
    }

    $service_defaultMasterIp = $defaults::service_defaultMasterIp ? {
        ''      => $ipaddress,
        default => $defaults::service_defaultMasterIp,
    }

    $service_defaultMasterFqdn = $defaults::service_defaultMasterFqdn ? {
        ''      => $fwdn,
        default => $defaults::service_defaultMasterFqdn, 
    }

    $service_defaultGatewayIp = $defaults::service_defaultGatewayIp ? {
        ''      => $ipaddress,
        default => $defaults::service_defaultGatewayIp, 
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

    $service_networkNumber = $service_networkNumber ? {
        ''      => $service_defaultNetworkNumber,
        default => $service_networkNumber,
    }

    $service_reverseNetworkNumber = $service_reverseNetworkNumber ? {
        ''      => $service_defaultReverseNetworkNumber,
        default => $service_reverseNetworkNumber,
    }

    $service_broadcastAddress = $service_broadcastAddress ? {
        ''      => $service_defaultBroadcastAddress,
        default => $service_broadcastAddress,
    }

    $service_hostNumber = $service_hostNumber ? {
        ''      => $service_defaultHostNumber,
        default => $service_hostNumber,
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
