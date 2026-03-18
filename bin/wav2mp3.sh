#!/usr/bin/env bash
set -euo pipefail

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file.wav> [file2.wav ...]" >&2
    exit 1
fi

for f in "$@"; do
    ffmpeg -i "$f" -codec:a libmp3lame -qscale:a 1 "${f%.wav}.mp3"
done
