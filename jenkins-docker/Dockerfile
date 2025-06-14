# Use LTS (Long-Term Support) version of Jenkins
FROM jenkins/jenkins:lts

# Switch to root to install extra packages if needed
USER root

# Install Docker CLI inside Jenkins container (optional but useful)
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean

# Add jenkins user to docker group (optional, for Docker inside Jenkins)
RUN usermod -aG docker jenkins

# Switch back to Jenkins user
USER jenkins
