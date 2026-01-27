#!/usr/bin/env bash
set -euo pipefail

npm --workspace frontend run lint
npm --workspace frontend run format:check
