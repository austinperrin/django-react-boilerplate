#!/usr/bin/env bash
set -euo pipefail

python -m pytest --maxfail=1 --disable-warnings --pass-with-no-tests -q
echo "Backend tests completed"
