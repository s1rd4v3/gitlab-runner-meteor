FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install node
RUN wget https://nodejs.org/dist/v0.10.40/node-v0.10.40-linux-x64.tar.gz && \
    tar xzf node-v0.10.40-linux-x64.tar.gz && \
    sudo cp -rp node-v0.10.40-linux-x64 /usr/local/ && \
    sudo ln -s /usr/local/node-v0.10.40-linux-x64 /usr/local/bin/node && \
    curl https://install.meteor.com/ | sh && \
    apt-get update && \
    apt-get install -y npm lftp


#echo "set ssl:verify-certificate false" >> /root/.lftprc

# sudo -u gitlab-runner echo 'PATH="/usr/local/node/bin:${PATH}"' >> /home/gitlab-runner/.bashrc
# touch /home/gitlab-runner/.lftprc && \

#ADD entrypoint /
#RUN chmod +x /entrypoint

#ENTRYPOINT ["/entrypoint"]
