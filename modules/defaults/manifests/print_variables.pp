# Convenience class to emit all defaults variables as a notice statement.
#
# == Variables
#
# == Authors
#
# Scot P. Floess <flossware@gmail.com>
# 
class defaults::print_variables inherits defaults {
    notice ( "netmask [${netmask}]  subnet [${subnet}]  networkNumber [${networkNumber}]  reverseNetworkNumber [${reverseNetworkNumber}]  broadcastAddress [${broadcastAddress}]  hostNumber [${hostNumber}]  internalDomain [${internalDomain}]  externalDomain [${externalDomain}]  masterHost [${masterHost}]  masterIp [${masterIp}]  masterFqdn [${masterFqdn}]  gatewayIp [${gatewayIp}]  execTimeout [${execTimeout}]  path [${path}]" )
}
