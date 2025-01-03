#!/usr/bin/env sh

# Creates the nix modules for using @rose-pine/build
# This only needs to be used if you need to update the version of @rose-pine/build

# First manually update package.json (edit and change the version of the '@rose-pine/build' dependency)

# Generate lockfile (only v1 & v2 are supported), create .nix files from lockfile
nix-shell\
    -r 'npm i --lockfile-version 2 --package-lock-only && node2nix -l ./package-lock.json'\
    -p npmjs nodePackages.node2nix
