#!/bin/sh
MY_EMAIL="MY_EMAIL_ADDRESS"
DEST_IP="DROP_DOWN_SERVER_IP_ADDRESS"
CURRENT_IP="/home/qkboo/.current_ip" # ip address file

#[ -f ${CURRENT_IP} ] && echo "Found" || touch ${CURRENT_IP}

# get current ip address from eth0
IPADDRESS=$(/sbin/ifconfig eth0 | sed -n 's/.*inet addr:\([^ ]*\).*/\1/p')
if [ "${IPADDRESS}" != "$(cat ${CURRENT_IP})" ]
then
# ssh with public key authentication
scp -i /home/qkboo/.ssh/id_rsa ${CURRENT_IP} qkboo@${DEST_IP}:/home/qkboo/.server_current_ip

fi
