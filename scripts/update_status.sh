#!/bin/bash
NODE="Store"
OUTPUT="public/status.md"
BUILD_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
FILE_COUNT=$(find content -type f -name "*.md" | wc -l)

cat <<LOG > $OUTPUT
---
title: "System Status — $NODE"
date: "$BUILD_TIME"
---

## $NODE Build Summary
- Build Time (UTC): **$BUILD_TIME**
- Total Markdown Files: **$FILE_COUNT**
- Status: ✅ Successful

Generated automatically by \`update_status.sh\`
LOG

echo "🩸 [$NODE] Status file updated → $OUTPUT"
