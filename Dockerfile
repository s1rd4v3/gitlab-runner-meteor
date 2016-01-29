FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install node
RUN wget https://nodejs.org/dist/v0.10.40/node-v0.10.40-linux-x64.tar.gz && \
    tar xzf node-v0.10.40-linux-x64.tar.gz && \
    sudo cp -rp node-v0.10.40-linux-x64 /usr/local/ && \
    sudo ln -s /usr/local/node-v0.10.40-linux-x64 /usr/local/node && \
    sudo -u gitlab-runner echo 'PATH="/usr/local/node/bin:${PATH}"' >> /home/gitlab-runner/.bashrc



#ADD entrypoint /
#RUN chmod +x /entrypoint

#ENTRYPOINT ["/entrypoint"]
