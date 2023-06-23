# lambda-promtail
This Dockerfile solves the problem of inputting AWS Secrets Manager into the basic auth part of connecting to a Loki instance. At Kruger we were trying to solve a problem with starting up a Docker container in Lambda, where we could use environment variables inside the container for the password field instead of stating the secret in AWS Lambda environment variables. That would expose the password inside the console.

# How does this work?
When the container starts it runs the entrypoint.sh script and it calls the Amazon Resource Name (ARN) using the AWSCLI. The ARN for the AWS Secrets Manager resource is inputted as an environment variable in AWS Lambda. 

# Requirements
You need the following:
* AWS Lambda environment variables must be set such as WRITE_ADDRESS, USERNAME and PASSWORD. The PASSWORD must contain the ARN for the AWS Secrets Manager resource.
* You also need things such as AWS Elastic Container Registry (ECR) to upload and run your Docker image from.
* You need a Loki-instance where WRITE_ADDRESS should point to.
* This deployment assumes that you use basic auth in front of your Loki-intance.
 
# Build
```
# Builds the Docker image. You don't have to use promtail as tag.
# You can use whatever you feel it.
$ docker build -t promtail . 
```
