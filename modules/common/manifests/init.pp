/*
    Class: common::variables

    This class contains common variables that can be used across modules.  It utilizes the
    empty class +defaults+ for default values.  If a default value is not found, all attempts
    are made to define a "good enough" default value.

    Variables contained here can be utilized either from a generic perspective or are defined
    when 2 or more classes use said variable (thereby computing and storing the variable in one
    class).  Overriding values for these variables can either be done in yaml or by defining a
    default value for the variable.

    Default values are searched in the +defaults+ class.  If not found, a "good enough" default
    is defined.  Variables are then set, first examining if the variable is defined and if so
    that value is used.  Otherwise, the default value is used.

    Variables for this class, as well as all variables in all modules, should follow the following
    naming convention:
        - default variables:  [class name]_default[MeaningfulVariableName in upper camel case].
                              common_defaultNetmask

        - variable:  [class name]_[meaningfulVariableName in lower camel case].
                     common_netmask

    Parameters:
        common_netmask:
            The netmask for the network - for example 255.255.255.0

        common_subnet:
            The subnet address for the network - for example 192.168.168.0

        common_networkNumber:
            The network number for the network - for example in 192.168.168.253, the common_networkNumber is 192.168.168

        common_reverseNetworkNumber:
            The reverse network number (values in reverse order of common_networkNumber) - for example in 102.168.168.252, the common_reverseNetworkNumber is 168.168.192

        common_broadcastAddress:
            The broadcast address for things like DHCP and NTP - for example 192.168.168.0

        common_hostNumber:
            The host number (last octet in IP/Address) - for example in 192.168.168.253, the common_hostNumber is 253.

        common_internalDomain:
            The internal domain used - for example flossware.com

        common_externalDomain:
            The external domain used outside of this network - for example flossware.homelinux.org

        common_masterHost:
            The master server host name on this network.

        common_masterHostIp:
            The IP address of the master server on this network.

        common_masterHostFqdn:
            The fully qualified name of the master server on this network.

        common_gatewayIp:
            The IP address of the gateway on this network.
*/
class common::variables inherits overrides::variables {
    $common_defaultNetmask = $netmask_eth0

    $common_defaultSubnet = $network_eth0

    #
    # The template ComputeNetworkNumber.erb uses the variable common_computeNetworkNumber
    # in computing the network number.
    #
    $common_computeNetworkNumber = $common_defaultSubnet

    $common_defaultNetworkNumber = template ( "common/ComputeNetworkNumber.erb" )

    #
    # The template ComputeReverseNetworkNumber.erb uses the variable common_computeReverseNetworkNumber
    # in computing the reverse network number.
    #
    $common_computeReverseNetworkNumber = $common_defaultSubnet

    $common_defaultReverseNetworkNumber =  template ( "common/ComputeReverseNetworkNumber.erb" )

    $common_defaultsBroadcastAddress = "${common_defaultNetworkNumber}.255"

    #
    # The template ComputeHostNumber.erb uses the variable common_computeHostNumber
    # in computing the host number...
    #
    $common_computeHostNumber = $ipaddress

    $common_defaultHostNumber = template ( "common/ComputeHostNumber.erb" )

    $common_defaultInternalDomain = $domain

    $common_defaultExternalDomain = $domain

    $common_defaultMasterHost = $hostname

    $common_defaultMasterIp = $ipaddress

    $common_defaultMasterFqdn = $fwdn

    $common_defaultGatewayIp = $ipaddress


    # ------------------------------------------------------------
    # Define common values.  If defined, use that value otherwise
    # use the default values computed above.
    # ------------------------------------------------------------

    $common_netmask = $common_netmask ? {
        ''      => $common_defaultNetmask,
        default => $common_netmask,
    }

    $common_subnet = $common_subnet ? {
        ''      => $common_defaultSubnet,
        default => $common_subnet,
    }

    $common_networkNumber = $common_networkNumber ? {
        ''      => $common_defaultNetworkNumber,
        default => $common_networkNumber,
    }

    $common_reverseNetworkNumber = $common_reverseNetworkNumber ? {
        ''      => $common_defaultReverseNetworkNumber,
        default => $common_reverseNetworkNumber,
    }

    $common_broadcastAddress = $common_broadcastAddress ? {
        ''      => $common_defaultBroadcastAddress,
        default => $common_broadcastAddress,
    }

    $common_hostNumber = $common_hostNumber ? {
        ''      => $common_defaultHostNumber,
        default => $common_hostNumber,
    }

    $common_internalDomain = $common_internalDomain ? {
        ''      => $common_defaultInternalDomain,
        default => $common_internalDomain,
    }

    $common_externalDomain = $common_externalDomain ? {
        ''      => $common_defaultExternalDomain,
        default => $common_externalDomain,
    }

    $common_masterHost = $common_masterHost ? {
        ''      => $common_defaultMasterHost,
        default => $common_masterHost,
    }

    $common_masterIp = $common_masterIp ? {
        ''      => $common_defaultMasterIp,
        default => $common_masterIp,
    }

    $common_masterFqdn = $common_masterFqdn ? {
        ''      => $common_defaultMasterFqdn
        default => $common_masterFqdn, 
    }

    $common_gatewayIp = $common_gatewayIp ? {
        ''      => $common_defaultGatewayIp,
        default => $common_gatewayIp, 
    }
}
