#!/bin/bash
set -e

HUGO_VERSION=0.123.7

echo ">>> Installing Hugo v${HUGO_VERSION}..."
curl -L -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
tar -xzf hugo.tar.gz
chmod +x ./hugo

echo ">>> Building site..."
./hugo --gc --minify --cleanDestinationDir
