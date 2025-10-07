#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
source_file="${root_dir}/B1_escrito/anexos/plantillas.tex"

if [[ ! -f "${source_file}" ]]; then
  echo "No se encontró ${source_file}" >&2
  exit 1
fi

for target_dir in "${root_dir}"/B1_escrito/enunciado_*/; do
  [[ -d "${target_dir}" ]] || continue
  cp "${source_file}" "${target_dir}/plantillas.tex"
  echo "Actualizado ${target_dir}plantillas.tex"
done
