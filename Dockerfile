# Container image that runs your code
# FROM debian:9.5-slim
# FROM gitlab-registry.cern.ch/clange/cmssw-docker/slc5-cms:latest
FROM gitlab-registry.cern.ch/clange/cmssw-docker/cmssw_4_2_8:latest

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
USER root
RUN /bin/bash -c 'whoami; pwd; ls -la; cd ~/; pwd; ls /; ls /*/*.sh; ls /*/*/*.sh; chmod +x /entrypoint.sh; ls -la'

# Executes `entrypoint.sh` when the Docker container starts up 
ENTRYPOINT ["/entrypoint.sh"]
