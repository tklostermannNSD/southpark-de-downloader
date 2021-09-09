#!/usr/bin/env sh
if [ -e yt-dlp/ ]; then
    echo ">>> yt-dlp already downloaded, delete and redownload? [y/N]"
    read RES
    [ "$RES" = "y" ] || [ "$RES" = "Y" ] && rm -rf yt-dlp/
fi
if [ ! -e yt-dlp/ ]; then
    echo ">>> Cloning yt-dlp repo" &&
    git clone "https://github.com/yt-dlp/yt-dlp.git"
fi
echo ">>> Building yt-dlp"
make -C yt-dlp/
