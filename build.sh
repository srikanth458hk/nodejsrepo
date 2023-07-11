#!/bin/bash

# Clone the repository
git clone -b main https://github.com/srikanth458hk/nodejsrepo.git

# Build the Docker image
docker build -t nodejs .

