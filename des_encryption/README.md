# DES Encryption algo for CTF challenge.

The userdb.txt file is encrypted using the input.txt as your plain text.
It uses the decrypt.c application.
This is a stripped down version of the code found in des.c which comes
from: https://www.techiedelight.com/des-implementation-c/

The encrypted files is written to /opt/cu/usrs/userdb.txt

The des.c file is shared with the CTF teams during the challenge in order
to guide them in the direction of having to crack the DES key used to encrypt 
the file. Also, once the CTF gets into the FTP server, another hint is provided
in the info.txt file that DES is used. 

A copy of the code for decrypting the users.txt file is bundled with the COBOL code.
This is called by the application on load, where it calls the c program to decrypt the file.
It then ingests it and deletes the decrypted version of the file.

The key is stored in ctf_keys/key.txt and uses a weak DES key:

https://en.wikipedia.org/wiki/Weak_key#Weak_keys_in_DES


