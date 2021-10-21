FROM ubuntu:latest

COPY looking_glass.pub .

RUN DEBIAN_FRONTEND=noninteractive && apt update && apt install -y \
    ssh \
    traceroute \
    mtr \
    dnsutils \
    iputils-ping 

CMD ["/bin/bash"]
