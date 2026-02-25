#!/bin/bash
# Quick dashboard stats updater — called by cron or manually
# Updates the quick stats (BTC, ETH, solar) in dashboard-data.json

DATA_FILE="/Users/jimmy_mac_mini/.openclaw/workspace/projects/str-tracker/dashboard-data.json"

# Get BTC price
BTC=$(curl -s 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd' | python3 -c "import sys,json; print(json.load(sys.stdin)['bitcoin']['usd'])" 2>/dev/null)

# Get ETH price  
ETH=$(curl -s 'https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=usd' | python3 -c "import sys,json; print(json.load(sys.stdin)['ethereum']['usd'])" 2>/dev/null)

if [ -n "$BTC" ] && [ -n "$ETH" ]; then
    # Update prices in dashboard-data.json using python
    python3 << PYEOF
import json
with open("$DATA_FILE", "r") as f:
    data = json.load(f)
data["quickStats"]["btc"]["value"] = f"\${int(float('$BTC')):,}"
data["quickStats"]["eth"]["value"] = f"\${int(float('$ETH')):,}"
data["lastUpdated"] = "$(date -u +%Y-%m-%dT%H:%M:%S-08:00)"
with open("$DATA_FILE", "w") as f:
    json.dump(data, f, indent=2)
print(f"Updated: BTC=\${int(float('$BTC')):,}, ETH=\${int(float('$ETH')):,}")
PYEOF
fi
