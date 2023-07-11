#!/bin/bash

sh 'sudo docker pull public.ecr.aws/y6s3n1h9/nodejs:latest'
sh 'sudo docker run -itd --network=host public.ecr.aws/y6s3n1h9/nodejs:latest'
