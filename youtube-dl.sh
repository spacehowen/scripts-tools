#!/bin/bash
read -p "Ingrese la Url: " url
if [ "$url" != "" ]
then
    youtube-dl -x --audio-format mp3 $url
else
    echo "No pusiste una url"
fi
