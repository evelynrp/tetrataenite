#!/usr/bin/env bash
set -euo pipefail

# chrome-wrapper reimplements Google's launcher script. If upstream changes it,
# fail the build so the wrapper can be re-synced and this hash updated.
UPSTREAM_SHA256=aea09d69ce7f24d5901f6bfb15dd44d0c856e793e0a498f8d8393ec7d2c308ec
echo "$UPSTREAM_SHA256  /opt/google/chrome/google-chrome" | sha256sum -c -

ln -sfn /usr/libexec/chrome-wrapper /usr/bin/google-chrome-stable
