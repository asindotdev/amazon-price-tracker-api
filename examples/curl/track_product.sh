#!/usr/bin/env bash
# Track a Product – cURL example
# Usage: ASIN_API_KEY=your-key bash track_product.sh
set -euo pipefail

curl -sS --fail-with-body -X POST "https://www.asin.dev/api/v1/products" \
  -H "Authorization: Bearer ${ASIN_API_KEY}" \
  -H "Content-Type: application/json" \
  --data '{"product": "B09DFCB66S", "marketplace": "com", "wait": true}'
