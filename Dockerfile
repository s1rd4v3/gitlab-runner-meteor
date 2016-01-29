FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install node
RUN wget https://nodejs.org/dist/v0.10.40/node-v0.10.40-linux-x64.tar.gz && \
    tar xzf node-v0.10.40-linux-x64.tar.gz && \
    sudo cp -rp node-v0.10.40-linux-x64 /usr/local/ && \
    sudo ln -s /usr/local/node-v0.10.40-linux-x64 /usr/local/node && \
    sudo -u gitlab-runner echo 'PATH="/usr/local/node/bin:${PATH}"' >> /home/gitlab-runner/.bashrc

# install meteor
RUN sudo -u gitlab-runner curl https://install.meteor.com/ | sudo -u gitlab-runner sh

# install npm and lftp
RUN apt-get update && \
    apt-get install -y npm lftp && \
    echo "set ssl:verify-certificate false" >> /home/gitlab-runner/.lftprc

# touch /home/gitlab-runner/.lftprc && \
# sudo ln -s /usr/bin/nodejs /usr/local/bin/node && \
#ADD entrypoint /
#RUN chmod +x /entrypoint

#ENTRYPOINT ["/entrypoint"]
