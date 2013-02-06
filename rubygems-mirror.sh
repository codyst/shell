#!/bin/bash

RSYNC_PROXY=""
export RSYNC_PROXY


basedir=/data/repo/RubyGems/
logdir=$basedir/log
mirror=$basedir/rubygems-mirror

rake=/usr/bin/rake

date=`/bin/date '+%m_%d_%Y-%H:%M:%S'`

logfile=$logdir/log_$date.txt

cd $mirror

$rake mirror:update > $logfile
