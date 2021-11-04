FROM ubuntu:latest

RUN mkdir /root/.ssh && touch /root/.ssh/authorized_keys
COPY id_rsa.pub ./root/.ssh/authorized_keys

RUN DEBIAN_FRONTEND=noninteractive && apt update && apt install -y \
    ssh \
    traceroute \
    mtr \
    dnsutils \
    iputils-ping 

RUN service ssh start

CMD ["/usr/sbin/sshd","-D"]
