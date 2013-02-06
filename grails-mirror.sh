#!/bin/sh

RSYNC_PROXY=""
export RSYNC_PROXY

prog=/usr/bin/wget 

basedir=/data/repo/Grails/
logdir=$basedir/log
mirror=$basedir/grails-mirror

mkdir $basedir $logdir $mirror 2>/dev/null 

date=`/bin/date '+%m_%d_%Y-%H:%M:%S'`

logfile=$logdir/log_$date.txt

plugins=http://repo.grails.org/grails/plugins

core=http://repo.grails.org/grails/core

trunk=http://svn.codehaus.org/grails/trunk/grails-plugins/


cd $mirror

$prog -N -o $logfile -U mozilla -nH $plugins

$prog -N -o $logfile -U mozilla -nH $core

$prog -N -o $logfile -U mozilla -nH $trunk




