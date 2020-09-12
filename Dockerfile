FROM ubuntu

ARG ENV

WORKDIR /opt

RUN apt-get update -y
RUN apt-get install wget gcc make -y
RUN apt-get install libdb-dev libncurses5-dev libgmp-dev autoconf -y
RUN apt-get install open-cobol -y
#RUN apt-get install openssh-server
RUN apt-get install ssh

WORKDIR ~/

COPY containment_unit.cbl containment_unit.cbl
COPY users.txt users.txt
COPY test_keys/id_rsa_test.pub id_rsa_test.pub
COPY install.sh install.sh
RUN  chmod u+x install.sh
RUN  ./install.sh
