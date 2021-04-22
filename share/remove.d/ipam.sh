#!/bin/sh

OIFS="${IFS}"
IFS=","
for i in ${ip4_addr}; do
	IFS="${OIFS}"
	case "${i}" in
		10.0.1.*)
			cbsd ipam mode=delete subnet=10.0.1.0/24 ip4_addr=${i}
			ret=$?
			;;
	esac
	IFS=","
done
IFS="${OIFS}"

exit ${ret}
