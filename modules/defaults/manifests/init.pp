# This class contains common defaults that can be used in parameterized classes for default values.
#
# == Variables
#
# [*$netmask*]
#     The netmask for the network - for example 255.255.255.0
#
# [*$subnet*]
#     The subnet address for the network - for example 192.168.168.0
#
# [*$networkNumber*]
#     The network number for the network - for example in 192.168.168.253, the networkNumber is 192.168.168
#
# [*$reverseNetworkNumber*]
#     The reverse network number (values in reverse order of networkNumber) - for example in 102.168.168.252, the reverseNetworkNumber is 168.168.192
#
# [*$broadcastAddress*]
#     The broadcast address for things like DHCP and NTP - for example 192.168.168.0
#
# [*$hostNumber*]
#     The host number (last octet in IP/Address) - for example in 192.168.168.253, the hostNumber is 253.
#
# [*$internalDomain*]
#     The internal domain used - for example flossware.com
#
# [*$externalDomain*]
#     The external domain used outside of this network - for example flossware.homelinux.org
#
# [*$gatewayIp*]
#     The IP address of the gateway on this network.
#
# [*$execTimeout*]
#	The timeout for most exec statements
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
#
class defaults {
    $netmask = $::netmask_eth0
    $subnet  = $::network_eth0

    #
    # The template ComputeNetworkNumber.erb uses the variable computeNetworkNumber
    # in computing the network number.
    #
    $computeNetworkNumber = $subnet
    $networkNumber        = template ( "defaults/ComputeNetworkNumber.erb" )

    #
    # The template ComputeReverseNetworkNumber.erb uses the variable computeReverseNetworkNumber
    # in computing the reverse network number.
    #
    $computeReverseNetworkNumber = $subnet
    $reverseNetworkNumber        = template ( "defaults/ComputeReverseNetworkNumber.erb" )

    #
    # The broadcast address is the default network number.255
    #
    $broadcastAddress = "${networkNumber}.255"

    #
    # The template ComputeHostNumber.erb uses the variable computeHostNumber
    # in computing the host number...
    #
    $computeHostNumber = $::ipaddress

    $hostNumber = template ( "defaults/ComputeHostNumber.erb" )

    $internalDomain = $::domain
    $externalDomain = $::domain

    $gatewayIp = $::ipaddress

    $execTimeout = '601800'

    $path = ['/bin', '/sbin', '/usr/bin']
}
