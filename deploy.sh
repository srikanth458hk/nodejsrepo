#!/bin/bash

sudo docker pull public.ecr.aws/y6s3n1h9/nodejs:latest
sudo docker run -itd --network=host public.ecr.aws/y6s3n1h9/nodejs:latest
