# Container image that runs your code
FROM gitlab-registry.cern.ch/clange/cmssw-docker/cmssw_5_3_32:latest
#FROM cmsopendata/cmssw_5_3_32:latest

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Executes `entrypoint.sh` when the Docker container starts up 
ENTRYPOINT ["/entrypoint.sh"]
