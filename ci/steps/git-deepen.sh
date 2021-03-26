#!/usr/bin/env bash
set -euo pipefail

# progressively deepen a clone until we reach a non-grafted commit.
# used for getting the last lib/vscode commit for caching builds
# without pulling the whole git history for performance reasons.
main() {
  cd "$(dirname "$0")/../.."

  while git log -1 --oneline --decorate lib/vscode | grep grafted; do
    git fetch --deepen=10
  done
}

main "$@"
