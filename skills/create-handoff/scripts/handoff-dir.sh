#!/bin/bash
# Resolves and creates the handoff directory. Prints the path to stdout.
#
# Default:  ~/handoffs/<git-repo-name>
# Fallback: ~/handoffs/<current-directory-name>   (when not inside a git repo)
# Override: pass a directory as $1, used verbatim (tilde expanded by the shell).
#
# Status messages go to stderr so stdout stays a single clean path that the
# caller can capture.

set -euo pipefail

# Root for all handoffs unless the caller overrides the full path.
HANDOFF_ROOT="${HOME}/handoffs"

if [ "$#" -ge 1 ] && [ -n "${1:-}" ]; then
    TARGET="$1"
    echo "Using the directory supplied by the caller." >&2
else
    if REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"; then
        NAME="$(basename "$REPO_ROOT")"
        echo "Resolved repository name: ${NAME}" >&2
    else
        NAME="$(basename "$PWD")"
        echo "Not inside a git repository. Falling back to the current directory name: ${NAME}" >&2
    fi
    TARGET="${HANDOFF_ROOT}/${NAME}"
fi

mkdir -p "$TARGET"

# Warn about existing handoffs so the caller can cross-link rather than duplicate,
# and notice if it is about to overwrite one on the same topic.
COUNT="$(find "$TARGET" -maxdepth 1 -name '*.md' -type f 2>/dev/null | wc -l | tr -d ' ')"
if [ "$COUNT" -gt 0 ]; then
    echo "Directory already holds ${COUNT} handoff document(s):" >&2
    find "$TARGET" -maxdepth 1 -name '*.md' -type f -exec basename {} \; 2>/dev/null | sort | sed 's/^/  /' >&2
fi

echo "$TARGET"
