#!/usr/bin/env bash
set -euo pipefail

mypy --config-file ../../pyproject.toml .
