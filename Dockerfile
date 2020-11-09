FROM ubuntu:18.04

ARG ENV

WORKDIR /opt

RUN apt-get update -y --fix-missing
RUN apt-get install wget gcc make -y
RUN apt-get install libdb-dev libncurses5-dev libgmp-dev autoconf -y
RUN apt-get install open-cobol -y
RUN apt-get install xinetd telnetd -y
RUN apt-get install vsftpd -y
EXPOSE 23
EXPOSE 21
EXPOSE 22

WORKDIR cu/


COPY telnet /etc/xinetd.d/telnet
#COPY shells /etc/shells
COPY decrypt_users.c decrypt_users.c
COPY containment_unit.cbl containment_unit.cbl
COPY docker_entrypoint.sh docker_entrypoint.sh
COPY usrs/ usrs/
COPY ctf_keys/ ctf_keys/ 
COPY decrypted_users.txt decrypted_users.txt 
COPY docker_install.sh docker_install.sh
RUN  useradd -ms /opt/cu/containment_unit bsidesct
#RUN  useradd -m bsidesct
RUN  echo "bsidesct:bsidesct" | chpasswd 
RUN  chmod u+x docker_install.sh
RUN  chmod u+x docker_entrypoint.sh
RUN  chmod -R u+x usrs
RUN  chmod -R u+x ctf_keys
RUN  chmod u+x decrypted_users.txt
RUN  ./docker_install.sh
RUN  chown -R bsidesct:bsidesct /opt/cu
CMD ./containment_unit

ENTRYPOINT ["./docker_entrypoint.sh"]
