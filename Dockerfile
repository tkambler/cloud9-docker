FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y \
    wget \
    curl \
    git \
    openssh-client \
    build-essential \
    tmux \
    bash \
    g++ \
    make \
    curl \
    python \
    python-dev \
    python-pip \
    python-software-properties \
    zip \
    unzip

RUN cd /tmp \
    && wget https://nodejs.org/dist/v8.11.3/node-v8.11.3-linux-x64.tar.gz \
    && cd /usr/local \
    && tar --strip-components 1 -xzf /tmp/node-v8.11.3-linux-x64.tar.gz

WORKDIR /root
RUN git clone git://github.com/c9/core.git cloud9
RUN curl -s -L https://raw.githubusercontent.com/c9/install/master/link.sh | bash \
    && /root/cloud9/scripts/install-sdk.sh \
    && sed -i -e 's_127.0.0.1_0.0.0.0_g' /root/cloud9/configs/standalone.js \
    && mkdir /root/workspace
RUN npm i -g nodemon yarn grunt-cli gulp-cli
ENV TERM=xterm-256color

RUN mkdir -p /root/.c9

COPY user.settings /root/.c9/user.settings

RUN curl -sSL https://get.docker.com/ | sh
RUN pip install docker-compose
RUN curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN apt-get install -y -qq groff less
RUN pip install awscli --upgrade --user

ENTRYPOINT ["./cloud9/server.js", "--listen", "0.0.0.0", "--port", "80", "-w", "/root", "-b"]

EXPOSE 80
