#!/usr/bin/env bash
# Rebuild the encrypted, published slide deck.
#
# Usage:
#   PASSWORD=yourpassword ./build.sh
#
# Requires:
#   * python3
#   * staticrypt (npm install -g staticrypt)
#
# The unencrypted slides.html and images/ are kept locally (gitignored).
# The encrypted deliverable is written to docs/index.html and served by
# GitHub Pages from the /docs folder on the default branch.
set -euo pipefail

if [[ -z "${PASSWORD:-}" ]]; then
  echo "error: PASSWORD env var is required" >&2
  exit 1
fi

HERE="$(cd "$(dirname "$0")" && pwd)"
INLINED="${HERE}/build/slides_inline.html"
mkdir -p "${HERE}/build" "${HERE}/docs"

python3 - <<PY
import base64
from pathlib import Path
root = Path("${HERE}")
src = (root / "slides.html").read_text()
for png in sorted((root / "images").glob("*.png")):
    b64 = base64.b64encode(png.read_bytes()).decode()
    src = src.replace(f"images/{png.name}", f"data:image/png;base64,{b64}")
Path("${INLINED}").write_text(src)
PY

staticrypt "${INLINED}" -p "${PASSWORD}" -d "${HERE}/docs" --short >/dev/null
mv "${HERE}/docs/slides_inline.html" "${HERE}/docs/index.html"
rm -rf "${HERE}/build"
echo "built ${HERE}/docs/index.html"
