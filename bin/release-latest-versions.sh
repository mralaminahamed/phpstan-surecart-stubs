#!/usr/bin/env bash
#
# Generate SureCart stubs from all the latest versions.
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

set -e

WC_JSON="$(wget -q -O- "https://api.wordpress.org/plugins/info/1.0/surecart.json")"

for V in 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 2.10 2.11 2.12 2.13 2.14 2.15 2.16 2.17 2.18 2.19 2.20; do
    printf -v JQ_FILTER '."versions" | keys[] | select(test("^%s\\\\.%s\\\\.\\\\d+$"))' "${V%.*}" "${V#*.}"
    LATEST="$(jq -r "$JQ_FILTER" <<<"$WC_JSON" | sort -t "." -k 3 -g | tail -n 1)"
    if [ -z "$LATEST" ]; then
        continue
    fi

    echo "Releasing version ${LATEST} ..."

    if git -C "$ROOT_DIR" rev-parse "refs/tags/v${LATEST}" >/dev/null 2>&1; then
        echo "Tag exists!"
        continue
    fi

    git -C "$ROOT_DIR" status --ignored --short -- source/ | sed -n -e 's#^!! ##p' | xargs --no-run-if-empty -- rm -rf

    wget -P "$ROOT_DIR/source/" "https://downloads.wordpress.org/plugin/surecart.${LATEST}.zip"
    unzip -q -d "$ROOT_DIR/source/" "$ROOT_DIR/source/surecart.${LATEST}.zip"
    rm "$ROOT_DIR/source/surecart.${LATEST}.zip"

    echo "Generating stubs ..."
    "$SCRIPT_DIR/generate.sh"

    git -C "$ROOT_DIR" commit --all -m "Generate stubs for SureCart ${LATEST}"
    git -C "$ROOT_DIR" tag "v${LATEST}"
done
