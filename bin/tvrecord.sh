#!/bin/bash

# http://www.mail-archive.com/debian-user@lists.debian.org/msg529236.html

CH=$1

TV_OPTS="normid=7:chanlist=us-cable:width=640:height=480:device=/dev/video1:alsa=1:adevice=hw.1,0:amode=1:immediatemode=0"
VF_OPTS="crop=624:464:16:16,pp=lb,hqdn3d"
if [ -n "${2}" ]; then
  VF_OPTS="${VF_OPTS},${2}"
fi

now_date=`date '+%Y%m%d-%H%M%S'`
mencoder -tv $TV_OPTS:channel=$CH \
         -ovc lavc \
         -oac mp3lame \
         -vf $VF_OPTS -o ${now_date}.avi tv://
