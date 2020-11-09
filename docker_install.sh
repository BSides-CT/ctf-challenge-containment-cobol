#!/bin/bash

export TERM=xterm
#apt-get install systemd-sysv ubuntu-standard -y
if [[ ${ENV} == "DEV" ]]; then
   cobc -x containment_unit.cbl decrypt_users.c
elif [[ ${ENV} == "CTF" ]]; then
   cobc -x containment_unit.cbl decrypt_users.c
   rm containment_unit.cbl
   rm decrypt_users.c
else
   echo "Please include an ENV var CTF or DEV"
fi

/etc/init.d/xinetd restart
#systemctl start vsftpd
#systemctl enable vsftpd
