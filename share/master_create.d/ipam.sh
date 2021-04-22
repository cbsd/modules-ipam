#!/bin/sh

hostname=$( hostname )

OIFS="${IFS}"
IFS=","
for i in ${ip4_addr}; do
	IFS="${OIFS}"
	case "${i}" in
		10.0.1.*)
			cbsd ipam mode=update subnet=10.0.1.0/24 ip4_addr=${i} description="${emulator}" note="${hostname}" hostname="${host_hostname}"
			ret=$?
			;;
	esac
	IFS=","
done
IFS="${OIFS}"

exit ${ret}
