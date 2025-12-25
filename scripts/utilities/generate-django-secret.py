#!/usr/bin/env python3
"""
Generate a Django SECRET_KEY value.

Usage:
  scripts/utilities/generate-django-secret.py
"""

import secrets
import string

ALPHABET = string.ascii_lowercase + string.digits + "!@#$%^&*(-_=+)"


def main() -> None:
    print("".join(secrets.choice(ALPHABET) for _ in range(50)))


if __name__ == "__main__":
    main()
