#!/usr/bin/env bash
# List Tracked Products – cURL example
# Usage: ASIN_API_KEY=your-key bash list_products.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://www.asin.dev/api/v1/products" \
  -H "Authorization: Bearer ${ASIN_API_KEY}" \
  --data-urlencode filter=drops \
  --data-urlencode limit=20
