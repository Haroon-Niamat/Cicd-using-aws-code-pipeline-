#!/bin/bash

# Log in to ECR

# Stop and remove the existing container if it exists
docker stop flask-app || true
docker rm flask-app || true

AWS_DEFAULT_REGION="ap-south-1"
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com

# remove image from local
docker image rm $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/flask-app:latest

# Pull the latest Docker image
docker pull $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/flask-app:latest



# Run the Docker container
docker run  -d --name flask-app -p 3000:3000 $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/flask-app:latest
