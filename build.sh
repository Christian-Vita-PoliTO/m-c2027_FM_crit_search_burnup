#!/bin/bash
# Compile the paper locally with Tectonic (self-contained LaTeX engine installed
# in the conda environment "tex"; it fetches the packages it needs on first run).
#   ./build.sh          -> main.pdf
set -e
cd "$(dirname "$0")"
TECTONIC="$HOME/codes/miniforge3/envs/tex/bin/tectonic"
[ -x "$TECTONIC" ] || { echo "tectonic not found: conda create -n tex -c conda-forge tectonic"; exit 1; }
"$TECTONIC" -X compile main.tex --keep-intermediates --synctex
echo
echo "pages: $(pdfinfo main.pdf 2>/dev/null | awk '/^Pages/{print $2}' || echo '?')   size: $(du -h main.pdf | cut -f1)"
