#!/bin/bash

DIR=`dirname $0`
NODE_YAML="${DIR}/yaml/system/$1.yaml"
GENERIC_YAML_DIR="${DIR}/yaml/generic"
LAPTOP_YAML="${GENERIC_YAML_DIR}/workstation.yaml"
WORKSTATION_VM_YAML="${GENERIC_YAML_DIR}/workstation-vm.yaml"
WORKSTATION_YAML="${GENERIC_YAML_DIR}/workstation.yaml"
VM_YAML="${GENERIC_YAML_DIR}/vm.yaml"
HOST_YAML="${GENERIC_YAML_DIR}/host.yaml"

if [ -e "${NODE_YAML}" ]
then
	cat "${NODE_YAML}"
elif [ "$1" != "`echo $1 | sed 's/laptop//'`" ]
then
	cat "${LAPTOP_YAML}"
elif [ "$1" != "`echo $1 | sed 's/workstation-vm//'`" ]
then
	cat "${WORKSTATION_VM_YAML}"
elif [ "$1" != "`echo $1 | sed 's/workstation//'`" ]
then
	cat "${WORKSTATION_YAML}"
elif [ "$1" != "`echo $1 | sed 's/-vm//'`" ]
then
	cat "${VM_YAML}"
elif  [ "$1" != "`echo $1 | sed 's/-host//'`" ]
then
	cat "${HOST_YAML}"
elif  [ "$1" != "`echo $1 | sed 's/-server//'`" ]
then
	cat "${HOST_YAML}"
fi


exit 0
