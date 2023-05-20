#!/bin/bash

set -exo pipefail

# Install curl
apt-get update
apt-get install -y curl

# Install Juliaup and set Julia version
echo $JULIA_VERSION
curl -fsSL https://install.julialang.org | sh -s -- -y
. /root/.profile
juliaup add $JULIA_VERSION
juliaup default $JULIA_VERSION

# Verify Julia installation
julia -e 'using InteractiveUtils; versioninfo(verbose=true)'

# Build package
# Based on julia-buildpkg GitHub Action
# Source: https://github.com/julia-actions/julia-buildpkg/blob/main/action.yml
julia --color=yes --project=. -e 'using Pkg; Pkg.Registry.add("General"); Pkg.build(verbose=true)'

# Run tests
julia --color=yes --project=. -e 'using Pkg; Pkg.test()'
