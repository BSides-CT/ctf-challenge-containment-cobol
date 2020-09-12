#!/bin/bash

export TERM=xterm
if [[ ${ENV} == "DEV" ]]; then 
   cobc -x -o containment_unit containment_unit.cbl
   /etc/init.d/xinetd restart
else
   cobc -x -o containment_unit containment_unit.cbl
   rm containment_unit.cbl
   /etc/init.d/xinetd restart
fi

