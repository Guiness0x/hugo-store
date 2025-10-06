#!/bin/bash
echo "🧩 [Store] Preflight Verification"

grep -rL "title:" content/ | while read -r f; do echo "⚠️ Missing title → $f"; done
grep -rL "date:" content/ | while read -r f; do echo "⚠️ Missing date → $f"; done

untracked=$(git ls-files --others --exclude-standard content/)
[ -n "$untracked" ] && echo "⚠️ Untracked files:" && echo "$untracked" || echo "✅ All files tracked"

echo "✅ Store check complete."
