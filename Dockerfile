FROM ubuntu:18.04

ARG ENV

WORKDIR /opt

RUN apt-get update -y --fix-missing
RUN apt-get install wget gcc make -y
RUN apt-get install libdb-dev libncurses5-dev libgmp-dev autoconf -y
RUN apt-get install open-cobol -y
RUN apt-get install xinetd vsftpd telnetd -y
EXPOSE 23
EXPOSE 21
EXPOSE 20
EXPOSE 10090-10100
WORKDIR cu/

COPY telnet /etc/xinetd.d/telnet
COPY ftp /etc/xinetd.d/ftp
COPY vsftpd /etc/vsftpd.conf
COPY shells /etc/shells
COPY decrypt_users.c decrypt_users.c
COPY containment_unit.cbl containment_unit.cbl
COPY docker_entrypoint.sh docker_entrypoint.sh
COPY usrs/ usrs/
COPY ctf_keys/ ctf_keys/ 
COPY decrypted_users.txt decrypted_users.txt 
COPY docker_install.sh docker_install.sh
RUN  useradd -ms /opt/cu/containment_unit bsidesct
RUN  echo "bsidesct:bsidesct" | chpasswd 
RUN  mkdir /var/run/vsftpd
RUN  mkdir /var/run/vsftpd/empty
RUN  chmod u+x docker_install.sh
RUN  chmod u+x docker_entrypoint.sh
RUN  chmod -R 777 usrs/
RUN  chmod -R u+x ctf_keys
RUN  chmod 777 decrypted_users.txt
RUN  ./docker_install.sh
RUN  chown -R bsidesct:bsidesct /opt/cu
RUN  chown -R bsidesct:bsidesct /opt/cu/usrs/userdb.txt
CMD ./containment_unit
ENTRYPOINT ["./docker_entrypoint.sh"]
