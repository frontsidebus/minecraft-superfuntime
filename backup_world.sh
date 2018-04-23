#!/bin/bash
#
#
##Backup script for local minecraft server
##Script pushes world dir out to a configured host
#
#

#remote user, ip, and destination directory
USER=<backup dest user>
DEST=<backup dest host>
DESTDIR=/home/minecraft/backups/
#local files
WORLDDIR=/home/minecraft-admin/world/
BACKUPDIR=/home/minecraft-admin/backups/
DATE=$(date +%Y%m%d)
BACKUPFILE=$DATE.tar.gz
#local ttl in days, before local backups are removed
LOCALTTL=5
#
#
function stage () {
	tar -czvf $BACKUPDIR$BACKUPFILE $WORLDDIR
}
function push () {
	scp $BACKUPDIR$BACKUPFILE $USER@$DEST:$DESTDIR$BACKUPFILE
}
function cleanup () {
	#find $BACKUPDIR -mindepth 1 -mtime +$LOCALTTL -print
	find $BACKUPDIR -mindepth 1 -mtime +$LOCALTTL -delete
}
#
stage
push
cleanup
#profit!
