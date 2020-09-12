#!/bin/bash

export TERM=xterm
if [[ ${ENV} == "DEV" ]]; then 
   cobc -x -o containment_unit containment_unit.cbl
else
   cobc -x -o containment_unit containment_unit.cbl
   rm containment_unit.cbl
   mkdir -p ~/.ssh
   touch ~/.ssh/authorized_keys
   cat ~/id_rsa_test.pub >> ~/.ssh/authorized_keys 
   rm ~/id_rsa_test.pub
   systemctl ssh start
   systemctl ssh enable
   service ssh status
fi

