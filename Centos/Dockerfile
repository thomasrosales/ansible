FROM centos:7

RUN yum -y update \
    && yum -y install nano \
    && yum -y install epel-release \
    && yum -y install python3 \
    && yum -y install python3-pip

RUN yum -y install openssh && yum -y install openssh-server

RUN yum -y install ansible

RUN pip3 install apache-libcloud

COPY open-ssl.sh /
RUN chmod 777 open-ssl.sh && chown root:root open-ssl.sh

WORKDIR /root/

CMD ["/bin/bash", "open-ssl.sh"]