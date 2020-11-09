if [[ ! -d "/opt/cu" ]]
then
  mkdir /opt/cu
fi

cp -r ctf_keys /opt/cu/
cp -r usrs /opt/cu/
cp decrypted_users.txt /opt/cu/
cobc -x containment_unit.cbl decrypt_users.c
mv containment_unit /opt/cu/
