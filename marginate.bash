#!/usr/bin/env bash
# [usage]
# ./marginate.bash <file.pdf>

FILE="$1"

if [[ "$#" -ne 1 ]] || [[ -z "$FILE" ]]; then
    echo "Usage: $0 <file.pdf>"
fi

OUTPUT="$(mktemp -d)"

cp template.tex "$OUTPUT/template.tex"
cp test_target.pdf "$OUTPUT/test_target.pdf"
pushd "$OUTPUT" 2> /dev/null
latexmk -pdf template
popd

mv "$OUTPUT/template.pdf" template.pdf
rm -rf "$OUTPUT"
