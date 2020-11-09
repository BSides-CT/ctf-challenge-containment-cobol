#!/bin/bash

export TERM=xterm
if [[ ${ENV} == "DEV" ]]; then
   cobc -x containment_unit.cbl decrypt_users.c
elif [[ ${ENV} == "CTF" ]]; then
   cobc -x containment_unit.cbl decrypt_users.c
   rm containment_unit.cbl
   rm decrypt_users.c
else
   echo "Please include an ENV var CTF or DEV"
fi

ln -s /opt/cu/usrs /home/bsidesct/usrs
/etc/init.d/xinetd restart
