#!/bin/sh
sources_repo_path="~/Documents/codice_elf0/dot-files/.config/nvim"

for file in $(git ls-files)
do 
  target_path="$sources_repo_path"/"$(dirname "$file")"
  mkdir -p "$target_path"
  echo "cp $file $target_path"
  cp "$file" "$target_path"
done
