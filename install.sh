#!/bin/bash

export TERM=xterm
if [[ ${ENV} == "DEV" ]]; then 
   cobc -x -o containment_unit containment_unit.cbl
else
   cobc -x -o containment_unit containment_unit.cbl
   rm containment_unit.cbl
fi

