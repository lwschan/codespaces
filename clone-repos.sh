#!/usr/bin/env bash

script_folder="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
workspaces_folder="$(cd "${script_folder}/.." && pwd)"

clone-repo()
{
    cd "${workspaces_folder}"
    if [ ! -d "${1#*/}" ]; then
        git clone "https://github.com/$1"
    else 
        echo "Already cloned $1"
    fi
}

if [ -f "${script_folder}/repos.txt" ]; then
    while IFS= read -r repository; do
        clone-repo "$repository"
    done < "${script_folder}/repos.txt"
fi
