#!/bin/bash

# Removes junk included in a torrent downloaded from RARBG, including Samples
# Typical usage is script execution following a completed download

# ! Remember to `cd` into your appropriate directory

find . -depth -type f \( -name "RARBG_DO_NOT_MIRROR.exe" -o -name "RARBG.txt" \) -o -type d -name "Sample" | xargs rm -rfv
find . -type d -empty -delete -print