if [[ ! -d "/opt/cu" ]]
then
  mkdir /opt/cu
fi

gcc encrypt.c -o encrypt 
