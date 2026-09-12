#!/usr/bin/env bash
# Render markdown resumes/letters to PDF and DOCX.
#   ./build-docs.sh                 # builds every .md in dist/, temp/ and temp/*/
#   ./build-docs.sh path/to/file.md # builds just that file
# Output lands next to the source .md.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STYLE="$HERE/.pandoc/header.tex"
REF="$HERE/.pandoc/reference.docx"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

build() {
  local src="$1" base dir
  dir="$(dirname "$src")"; base="$(basename "$src" .md)"

  # <br /> is redundant once hard_line_breaks is on, and LaTeX drops raw HTML.
  sed 's|<br />||g' "$src" > "$TMP/src.md"

  pandoc "$TMP/src.md" \
    --from=markdown+hard_line_breaks \
    --pdf-engine=xelatex \
    --include-in-header="$STYLE" \
    -V geometry:margin=0.6in \
    -V fontsize=10pt \
    -V colorlinks=true -V linkcolor=black -V urlcolor=black \
    -V mainfont="Liberation Serif" \
    -o "$dir/$base.pdf"

  local refopt=()
  [[ -f "$REF" ]] && refopt=(--reference-doc="$REF")
  pandoc "$TMP/src.md" --from=markdown+hard_line_breaks "${refopt[@]}" -o "$dir/$base.docx"

  echo "built: $base.pdf, $base.docx"
}

if [[ $# -gt 0 ]]; then
  for f in "$@"; do build "$f"; done
else
  shopt -s nullglob
  for f in "$HERE"/dist/*.md "$HERE"/temp/*.md "$HERE"/temp/*/*.md; do
    [[ "$(basename "$f")" == "job.txt" ]] && continue
    build "$f"
  done
fi
