#!/bin/bash

# Login to AWS ECR Public
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/j2d9m4m0

# Tag the Docker image
docker tag nodejs:latest public.ecr.aws/j2d9m4m0/nodejs:latest

# Push the Docker image to AWS ECR Public
docker push public.ecr.aws/j2d9m4m0/nodejs:latest
