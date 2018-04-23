#!/bin/bash
#
#java -Xmx4096M -Xms4096M -jar server.jar nogui
#
JARFILE=/home/minecraft-admin/server.jar
#
MAXMEMPOOL=4g
INITMEMPOOL=1g
#
function start_server {
        java -Xmx$MAXMEMPOOL -Xms$INITMEMPOOL -jar $JARFILE nogui
}
#
start_server

