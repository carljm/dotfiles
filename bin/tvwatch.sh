#!/bin/bash

# http://www.mail-archive.com/debian-user@lists.debian.org/msg529236.html

CH=$1

TV_OPTS="normid=7:chanlist=us-cable:width=640:height=480:device=/dev/video1:alsa=1:adevice=hw.1,0:amode=1:immediatemode=0"

padsp mplayer -tv $TV_OPTS:channel=$CH tv://
