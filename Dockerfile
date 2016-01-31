FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install node
RUN apt-get update && \
    apt-get install -y npm lftp && \
    wget https://nodejs.org/dist/v0.10.40/node-v0.10.40-linux-x64.tar.gz && \
    tar xzf node-v0.10.40-linux-x64.tar.gz && \
    ln -s /usr/bin/nodejs /usr/local/bin/node && \
    sudo cp -rp node-v0.10.40-linux-x64 /usr/local/ && \
    sudo ln -s /usr/local/node-v0.10.40-linux-x64 /usr/local/node && \
    curl https://install.meteor.com/ | sh && \
    echo 'PATH="/usr/local/node/bin:${PATH}"' >> /etc/bash.bashrc
