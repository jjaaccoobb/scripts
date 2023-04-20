#!/usr/bin/env bash

# Removes junk included in a torrent downloaded from RARBG, including Samples
# Typical usage is script execution following a completed download

# Target directory is from where the script was run, or a valid directory argument

TARGET_DIR=$(pwd)

if [ ! -z $1 ]; then
    if [ -d $1 ]; then
        TARGET_DIR=$1
    fi
fi

find "$TARGET_DIR" -depth -type f \( -name "RARBG_DO_NOT_MIRROR.exe" -o -name "RARBG.txt" \) -o -type d -name "Sample" | xargs rm -rfv
find "$TARGET_DIR" -type d -empty -delete -print