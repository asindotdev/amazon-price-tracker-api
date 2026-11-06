#!/usr/bin/env bash
# Plan and Remaining Credits – cURL example
# Usage: ASIN_API_KEY=your-key bash account.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://www.asin.dev/api/v1/account" \
  -H "Authorization: Bearer ${ASIN_API_KEY}"
