#!/bin/bash

# Login to AWS ECR Public
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/y6s3n1h9

# Tag the Docker image
docker tag nodejs:latest public.ecr.aws/y6s3n1h9/nodejs:latest

# Push the Docker image to AWS ECR Public
docker push public.ecr.aws/y6s3n1h9/nodejs:latest
