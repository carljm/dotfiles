#!/bin/bash


if [ -z "$DVDDEVICE" ]; then
  if [ -e /dev/dvd1 ]; then
    DVDDEVICE="/dev/dvd1"
  else
    DVDDEVICE="/dev/dvd"
  fi
fi

mencoder dvd://$1 -dvd-device $DVDDEVICE -oac copy -alang en -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=1100:vhq:autoaspect:vpass=1 $3 -o /dev/null
mencoder dvd://$1 -dvd-device $DVDDEVICE -oac copy -alang en -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=1100:vhq:autoaspect:vpass=2 $3 -o $2
rm divx2pass.log
