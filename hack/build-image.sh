#!/usr/bin/env bash
set -eux

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <repo> <tag>"
    exit 1
fi

echo
echo "Start build images, Repo: $1, Tag: $2"
echo

for dir in ts-*; do
    if [[ -d $dir ]]; then
        if [[ "$dir" == "ts-avatar-service" ]]; then
            echo "Skipping directory: ${dir}"
            continue  # 跳过 ts-avatar-service 目录
        fi

        if [[ -n $(ls "$dir" | grep -i Dockerfile) ]]; then
            echo "Building image for directory: ${dir}"
            docker build -t "$1"/"${dir}":"$2" "$dir"
        else
            echo "No Dockerfile found in directory: ${dir}"
        fi
    fi
done
