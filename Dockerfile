FROM ubuntu:latest

COPY . .
COPY probes.json /config/
COPY looking_glass looking_glass.pub .

RUN DEBIAN_FRONTEND=noninteractive && apt update && apt install -y curl ssh 
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add - && \
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN npm install
EXPOSE 8080
ENTRYPOINT [ "node", "lg.js" ]
