#!/usr/bin/env bash

folders=(
	"Documents"
	"Music"
	"Pictures"
)

if [ $# -eq 1 ]; then
	folder="$1"
else
	folder="$(pwd)"
fi

file="$folder/home_$(date +%d_%m_%Y_%H-%M-%S).tar"

tar cvf "$file" -C "$HOME" "${folders[@]}"