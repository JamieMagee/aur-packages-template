#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <base> <head>" >&2
  exit 2
fi

base=$1
head=$2

if [[ $base =~ ^0+$ ]]; then
  base=$(git mktree </dev/null)
fi

git diff --name-only --diff-filter=ACMR "$base" "$head" -- '*/PKGBUILD' |
  awk -F/ 'NF == 2 { print $1 }' |
  LC_ALL=C sort -u |
  jq --raw-input --slurp --compact-output \
    'split("\n") | map(select(length > 0))'
