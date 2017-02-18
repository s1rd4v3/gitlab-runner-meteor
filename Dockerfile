FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install node
RUN apt-get update && \
    apt-get install -y npm lftp && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
    sudo apt-get install -y nodejs && \
    curl https://install.meteor.com/ | sh && \
    echo 'PATH="/usr/local/node/bin:${PATH}"' >> /etc/bash.bashrc
