FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y nano \ 
    && apt-get install -y openssh-server \
    && apt-get install -y gnupg \
    && apt-get install -y python3 python3-pip

RUN apt-get install -y software-properties-common \
    && apt-add-repository --yes --update ppa:ansible/ansible \
    && apt-get update \
    && apt-get install -y ansible

RUN apt-get -y install sudo

RUN mkdir /var/run/sshd

RUN useradd trosales \
    && passwd -d trosales \
    && mkdir /home/trosales \
    && chown trosales:trosales /home/trosales \
    && addgroup trosales staff \
    && chpasswd && addgroup trosales sudo \
    && true

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER trosales

RUN mkdir /home/trosales/.ssh && \
    touch /home/trosales/.ssh/authorized_keys && \
    chmod 765 /home/trosales/.ssh && \
    chmod 765 /home/trosales/.ssh/authorized_keys

RUN sudo mkdir /root/.ssh && \
    sudo touch /root/.ssh/authorized_keys && \
    sudo chmod 700 /root/.ssh && \
    sudo chmod 600 /root/.ssh/authorized_keys

COPY ssh-service.sh /
RUN sudo chmod 777 ssh-service.sh && sudo chown trosales:trosales ssh-service.sh

ENTRYPOINT ["/ssh-service.sh"]

WORKDIR /home/trosales