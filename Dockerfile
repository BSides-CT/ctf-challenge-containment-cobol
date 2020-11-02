FROM ubuntu

ARG ENV

WORKDIR /opt

RUN apt-get update -y
RUN apt-get install wget gcc make -y
RUN apt-get install libdb-dev libncurses5-dev libgmp-dev autoconf -y
RUN apt-get install open-cobol -y
RUN apt-get install xinetd telnetd -y

WORKDIR ~/

COPY decrypt_users.c decrypt_users.c
COPY containment_unit.cbl containment_unit.cbl
COPY usrs/ usrs/
COPY docker_install.sh docker_install.sh
RUN  chmod u+x docker_install.sh
RUN  ./docker_install.sh
