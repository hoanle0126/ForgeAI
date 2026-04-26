#!/usr/bin/env bash
set -euo pipefail

hidden_dirs=()

restore_hidden_dirs() {
  local entry
  for ((i=${#hidden_dirs[@]}-1; i>=0; i--)); do
    entry="${hidden_dirs[i]}"
    mv "${entry#*:}" "${entry%%:*}"
  done
}

hide_dir_for_custom_lint() {
  local source_dir="$1"
  local hidden_dir="$2"

  if [[ -d "$source_dir" ]]; then
    mv "$source_dir" "$hidden_dir"
    hidden_dirs+=("$source_dir:$hidden_dir")
  fi
}

flutter analyze

trap restore_hidden_dirs EXIT
hide_dir_for_custom_lint ".worktrees" ".worktrees.check.$$"
hide_dir_for_custom_lint "worktrees" ".worktrees_external.check.$$"
flutter pub run custom_lint
restore_hidden_dirs
trap - EXIT

format_roots=(lib tools)
if [[ -d test ]]; then
  format_roots+=(test)
fi

mapfile -t format_files < <(
  find "${format_roots[@]}" -type f -name '*.dart' \
    ! -name '*.g.dart' \
    ! -name '*.freezed.dart' | sort
)

dart format --output=none --set-exit-if-changed "${format_files[@]}"
