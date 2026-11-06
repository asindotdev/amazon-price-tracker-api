#!/usr/bin/env bash
# Get a Tracked Product – cURL example
# Usage: ASIN_API_KEY=your-key bash get_product.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://www.asin.dev/api/v1/products/8f0b3c7e-2a4d-4e51-9c1a-6d2f1b9e7a30" \
  -H "Authorization: Bearer ${ASIN_API_KEY}" \
  --data-urlencode days=30
