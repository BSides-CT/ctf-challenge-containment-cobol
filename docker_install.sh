#!/bin/bash

export TERM=xterm
#apt-get install systemd-sysv ubuntu-standard -y
if [[ ${ENV} == "DEV" ]]; then
   cc -c decrypt_users.c
   cobc -x containment_unit.cbl decrypt_users.o
   /etc/init.d/xinetd restart
   #systemctl start vsftpd
   #systemctl enable vsftpd
elif [[ ${ENV} == "CTF" ]]; then
   cc -c decrypt_users.c
   cobc -x containment_unit.cbl decrypt_users.o
   rm containment_unit.cbl
   rm decrypt_users.c
   /etc/init.d/xinetd restart
   #systemctl start vsftpd
   #systemctl enable vsftpd
else
   echo "Please include an ENV var CTF or DEV"
fi

