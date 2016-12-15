#!/bin/bash

ffmpeg -re -stream_loop -1 -i 'we_are_the_world.mp4' -acodec libfdk_aac -vcodec libx264 -f flv "rtmp://127.0.0.1/live/mdst"
