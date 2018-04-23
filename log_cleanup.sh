#!/bin/bash
#minecraft log cleanup script
LOGDIR=/home/minecraft-admin/logs/
LOGTTL=5 ##in days

clean_logs () {
        #find $LOGDIR -mindepth 1 -mtime +$LOGTTL -print
        find $LOGDIR -mindepth 1 -mtime +$LOGTTL -delete
}
#
clean_logs
