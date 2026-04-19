#!/usr/bin/env bash
set -euo pipefail

flutter analyze
dart run custom_lint

format_targets=(lib tools)
if [[ -d test ]]; then
  format_targets+=(test)
fi

dart format --output=none --set-exit-if-changed "${format_targets[@]}"
