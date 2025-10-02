#!/bin/sh
printf '\033c\033]0;%s\a' TopDownJump
base_path="$(dirname "$(realpath "$0")")"
"$base_path/TopDownJump1.1.1.1.x86_64" "$@"
