#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

env_sh_default=.env.sh.default
source "$env_sh_default"

env_sh=.env.sh
if [ -f "$env_sh" ]; then
	source "$env_sh"
fi

for mo in **/*.mo; do
	target="${mo#templates/}"
	target="${target%.mo}"
	mo < "$mo" | pv -N "$target" > "$target"
done