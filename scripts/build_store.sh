#!/bin/bash
echo "🚀 Building Hugo Store..."
bash scripts/verify_store.sh
hugo server -D
