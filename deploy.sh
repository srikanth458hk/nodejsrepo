#!/bin/bash

sh 'docker pull public.ecr.aws/y6s3n1h9/nodejs:latest'
sh 'docker run -itd --network=host public.ecr.aws/y6s3n1h9/nodejs:latest'
