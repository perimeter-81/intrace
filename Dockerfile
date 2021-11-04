FROM ubuntu:latest

COPY . .
COPY probes.json /config/

RUN mkdir /root/.ssh && touch /root/.ssh/authorized_keys
COPY looking_glass.pub ./root/.ssh/authorized_keys
COPY looking_glass looking_glass.pub ./root/.ssh/
RUN chmod 600 /root/.ssh
RUN chmod 600 /root/.ssh/looking_glass 
RUN chmod 600 /root/.ssh/authorized_keys

RUN DEBIAN_FRONTEND=noninteractive && apt update && apt install -y curl ssh 
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add - && \
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN npm install
EXPOSE 8080
ENTRYPOINT [ "node", "lg.js" ]
