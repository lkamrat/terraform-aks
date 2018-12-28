# Dockerfile for building Balerion Terraform bootstrap container image  
##################################################################

# Set the base image
FROM mydevacr.azurecr.io/dev/balerion:latest

# File Author / Maintainer
MAINTAINER Lior Kamrat

# Change working directory to where all the terraform and deployment files are
WORKDIR /balerion/provisioning

# Run the terraform plan to deploy K8s via Azure ARM template and the requested K8s apps
#ENTRYPOINT ["/bin/bash", "-c", "terraform init"]
#ENTRYPOINT ["/bin/bash", "-c", "terraform apply -auto-approve"] 