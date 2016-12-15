#!/bin/bash

ffmpeg -re -stream_loop -1 -i 'BigBuckBunny.mp4' -acodec libfdk_aac -vcodec libx264 -f flv "rtmp://127.0.0.1/live/mdst"
