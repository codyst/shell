#!/bin/sh

RSYNC_PROXY=""
export RSYNC_PROXY

prog=/usr/bin/rsync 

basedir=/data/repo/CPAN
logdir=$basedir/log
mirror=$basedir/cpan-mirror

date=`/bin/date '+%m_%d_%Y-%H:%M:%S'`

logfile=$logdir/log_$date.txt

#site=www.apache.org
site=cpan-rsync.perl.org

# rsync $site:: > $basedir/apache-mirror-list rsync -rtlzv --delete $site::apache-dist $mirror >$logfile 2>&1

$prog  -avz --delete --safe-links $site::CPAN $mirror 

