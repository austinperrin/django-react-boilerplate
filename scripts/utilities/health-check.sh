#!/usr/bin/env bash
set -euo pipefail

API_URL=${API_URL:-"http://localhost:8000/api/v1/common/health/"}
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$API_URL")
if [ "$HTTP_CODE" = "200" ]; then
  echo "Health check OK ($API_URL)"
else
  echo "Health check FAILED ($API_URL) -> status $HTTP_CODE" >&2
  exit 1
fi
