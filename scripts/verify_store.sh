#!/bin/bash
echo "🧩 [Store] Preflight Verification (Zola)"
if [ -f "config.toml" ]; then
    echo "✅ config.toml found."
else
    echo "⚠️ config.toml missing!"
fi

if [ -d "content" ]; then
    echo "✅ Content directory found."
else
    echo "⚠️ Content directory missing!"
fi

if [ -d "templates" ]; then
    echo "✅ Templates directory found."
else
    echo "⚠️ Templates directory missing!"
fi

echo "✅ Store verification complete."
