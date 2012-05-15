#!/bin/bash

CH=$1

now_date=`date '+%Y%m%d-%H%M%S'`
mencoder dvb://$CH \
         -ovc copy \
         -oac copy \
         -o ${now_date}.avi
