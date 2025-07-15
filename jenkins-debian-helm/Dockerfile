FROM jenkins/jenkins:lts

USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io && \
    ln -s /usr/bin/docker /usr/local/bin/docker

# Install Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Set permissions for Jenkins
RUN chown -R jenkins:jenkins /var/jenkins_home

USER jenkins
