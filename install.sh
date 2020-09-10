#!/bin/bash

export TERM=xterm
if [[ ${ENV} == "DEV" ]]; then 
   cobc -x -o containment_unit containment_unit.cbl
else
   echo "TODO"
fi

