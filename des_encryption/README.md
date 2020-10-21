# DES Encryption algo for CTF challenge.

The users.txt file is encrypted using the input.txt as ou plain text.
It uses the decrypt.c application.
This is a stripped down version of the code found in des.c which comes
from: https://www.techiedelight.com/des-implementation-c/


The des.c file is shared with the CTF teams during the challenge in order
to guide them in the diection of having to crack the DES key used to encrypt 
the file. 

A copy of the code for decrypting the users.txt file is bundled with the COBOL code.
This is called by the application on load, where it calls the c program to decrypt the file.
It then ingests it and deletes the decrypted version of the file.



