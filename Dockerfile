FROM ubuntu:18.04

ARG ENV

WORKDIR /opt

RUN apt-get update -y --fix-missing
RUN apt-get install wget gcc make -y
RUN apt-get install libdb-dev libncurses5-dev libgmp-dev autoconf -y
RUN apt-get install open-cobol -y
#RUN apt-get install systemd -y
RUN apt-get install xinetd telnetd -y
RUN apt-get install vsftpd -y

WORKDIR ~/

COPY decrypt_users.c decrypt_users.c
COPY containment_unit.cbl containment_unit.cbl
COPY usrs/ usrs/
COPY docker_install.sh docker_install.sh
RUN  chmod u+x docker_install.sh
RUN  ./docker_install.sh
