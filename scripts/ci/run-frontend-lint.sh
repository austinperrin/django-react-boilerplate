#!/usr/bin/env bash
set -euo pipefail

cd services/frontend
npm run lint
npm run format:check
