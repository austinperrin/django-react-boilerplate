#!/usr/bin/env bash
set -euo pipefail

ruff check services/backend
black --check services/backend
