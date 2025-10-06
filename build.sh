#!/bin/bash
set -e

# Force latest Hugo version
HUGO_VERSION=0.123.7

echo "Installing Hugo v$HUGO_VERSION..."
wget -qO- https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz | tar -xz

echo "Running Hugo build..."
./hugo --minify
