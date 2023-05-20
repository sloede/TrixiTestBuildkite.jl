#!/bin/bash

set -euxo pipefail

# # Set paths
# WORKING_DIR=$PWD
# JULIA_INSTALL_DIR=$(dirname $PWD)
# JULIA_VERSION_FULL=1.9.0
# JULIA_VERSION_MAJORMINOR=1.9
# JULIA_PREFIX=${JULIA_INSTALL_DIR}/julia-${JULIA_VERSION_FULL}
# export PATH="$JULIA_PREFIX/bin/:$PATH"
# 
# # Install wget
# apt-get update
# apt-get install -y wget
# 
# # Install Julia
# cd $JULIA_INSTALL_DIR
# wget https://julialang-s3.julialang.org/bin/linux/x64/${JULIA_VERSION_MAJORMINOR}/julia-${JULIA_VERSION_FULL}-linux-x86_64.tar.gz
# tar zxvf julia-${JULIA_VERSION_FULL}-linux-x86_64.tar.gz
# cd $WORKING_DIR

# Install curl
apt-get update
apt-get install -y curl

# Install Juliaup and set Julia version
echo $JULIA_VERSION
find .
curl -fsSL https://install.julialang.org | sh -s -- -y
juliaup add $JULIA_VERSION
juliaup default $JULIA_VERSION
find .

# Verify Julia installation
julia -e 'using InteractiveUtils; versioninfo(verbose=true)'
