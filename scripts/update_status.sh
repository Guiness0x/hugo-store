#!/bin/bash
# [Mil-Spec Segment – Authorized Rework Unit 2025-11-10]
# Syncs system status into Zola public HUD

STATUS_FILE="$HOME/Dossiers/store/public/status.md"
mkdir -p "$(dirname "$STATUS_FILE")"

# Determine status from Vault telemetry if present
VAULT_STATUS="Operational"

if grep -q "Degraded" "$HOME/Dossiers/vault/public/status.md" 2>/dev/null; then
    VAULT_STATUS="Degraded"
fi
if grep -q "Offline" "$HOME/Dossiers/vault/public/status.md" 2>/dev/null; then
    VAULT_STATUS="Offline"
fi

# Overall system logic
if [ "$VAULT_STATUS" = "Offline" ]; then
    OVERALL_STATUS="Offline"
elif [ "$VAULT_STATUS" = "Degraded" ]; then
    OVERALL_STATUS="Degraded"
else
    OVERALL_STATUS="Operational"
fi

echo "🩸 System Status: $OVERALL_STATUS" > "$STATUS_FILE"
echo "Zola Runtime Update: $(date '+%Y-%m-%d %H:%M:%S')" >> "$STATUS_FILE"

echo "✅ [Store] Status file updated → $STATUS_FILE"
