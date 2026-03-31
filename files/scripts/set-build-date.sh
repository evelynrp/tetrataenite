#!/usr/bin/env bash
set -euo pipefail

BUILD_DATE=$(date +%Y%m%d)
sed -i --sandbox "s|^PRETTY_NAME=.*|PRETTY_NAME=\"tetrataenite (${BUILD_DATE})\"|" /usr/lib/os-release