#!/bin/bash
for i in *.m4v; do ffmpeg -i "$i" -flags +global_header -vcodec copy -acodec copy "$(basename "$i" .m4v)".mp4  ; done
