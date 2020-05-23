FROM centos:7

RUN yum -y update \
    && yum -y install nano \
    && yum -y install epel-release \
    && yum -y install python3 \
    && yum -y install python3-pip \
    && yum -y group install 'Development Tools' \
    && yum -y install make gcc perl pcre-devel zlib-devel

RUN yum -y install openssh && yum -y install openssh-server

RUN yum -y install supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY script-test.sh /root/ 
RUN chmod +x /root/script-test.sh && sed -i -e 's/\r$//' /root/script-test.sh

RUN yum -y install ansible

RUN pip3 install apache-libcloud

COPY openssl.sh .
RUN chmod +x openssl.sh && chown root:root openssl.sh && sed -i -e 's/\r$//' openssl.sh

RUN cd /usr/local/src/ && curl https://ftp.openssl.org/source/old/1.1.1/openssl-1.1.1.tar.gz | tar -xzv

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
#ENTRYPOINT ["/openssl.sh"]
