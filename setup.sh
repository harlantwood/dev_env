#!/usr/bin/env bash
set -exuo pipefail

script_dir=$(pwd)

cd ~

if [[ -f .gitconfig ]]; then
  printf "\n\n# USER GITCONFIG FOLLOWS:\n\n" >> .gitconfig
  cat "${script_dir}/.gitconfig" >> .gitconfig
else
  ln -sf "${script_dir}/.gitconfig" .
fi

ln -sf "${script_dir}/.gitignore" .

grep "shell_ext_any_box" .zshrc || echo ". ${script_dir}/shell_ext_any_box.sh" >> .zshrc
