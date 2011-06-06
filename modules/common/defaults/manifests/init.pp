#    Class: common::variables
#
#    This class contains common variables that can be used across modules.  Variables defined here
#    are either considered common and usable across modules, or defined when 2 or more modules
#    use said variable.
#
#    Variables values can be defined in YAML or defined in the base class Variables.  For FlossWare,
#    the base class Variables contains no values.  However, for organizations utilizing the 
#    FlossWare puppet modules, defining the class Variables (and including that first in modulepath),
#    values can be set there.  If not values are set, "good enough" values are computed for defaults.
#
#    Parameters:
#        netmask:
#            The netmask for the network - for example 255.255.255.0
#
#        subnet:
#            The subnet address for the network - for example 192.168.168.0
#
#        networkNumber:
#            The network number for the network - for example in 192.168.168.253, the networkNumber is 192.168.168
#
#        reverseNetworkNumber:
#            The reverse network number (values in reverse order of networkNumber) - for example in 102.168.168.252, the reverseNetworkNumber is 168.168.192
#
#        broadcastAddress:
#            The broadcast address for things like DHCP and NTP - for example 192.168.168.0
#
#        hostNumber:
#            The host number (last octet in IP/Address) - for example in 192.168.168.253, the hostNumber is 253.
#
#        internalDomain:
#            The internal domain used - for example flossware.com
#
#        externalDomain:
#            The external domain used outside of this network - for example flossware.homelinux.org
#
#        masterHost:
#            The master server host name on this network.
#
#        masterHostIp:
#            The IP address of the master server on this network.
#
#        masterHostFqdn:
#            The fully qualified name of the master server on this network.
#
#        gatewayIp:
#            The IP address of the gateway on this network.
#
#		execTimeout:
#			The timeout for most exec statements
#
class defaults inherits variables {
    $netmask = $netmask_eth0

    $subnet = $network_eth0

    #
    # The template ComputeNetworkNumber.erb uses the variable computeNetworkNumber
    # in computing the network number.
    #
    $computeNetworkNumber = $defaultSubnet

    $networkNumber = template ( "common/ComputeNetworkNumber.erb" )

    #
    # The template ComputeReverseNetworkNumber.erb uses the variable computeReverseNetworkNumber
    # in computing the reverse network number.
    #
    $computeReverseNetworkNumber = $defaultSubnet

    $reverseNetworkNumber = template ( "common/ComputeReverseNetworkNumber.erb" )

    $broadcastAddress = "${defaultNetworkNumber}.255"

    #
    # The template ComputeHostNumber.erb uses the variable computeHostNumber
    # in computing the host number...
    #
    $computeHostNumber = $ipaddress

    $hostNumber = template ( "common/ComputeHostNumber.erb" )

    $internalDomain = $domain

    $externalDomain = $domain

    $masterHost = $hostname

    $masterIp = $ipaddress

    $masterFqdn = $fwdn

    $gatewayIp = $ipaddress

    $execTimeout = '601800'

    $path = '/bin:/usr/bin:/sbin'
}
