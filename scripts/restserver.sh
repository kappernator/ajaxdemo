#!/bin/bash 

##
# start|stop|restart python restserver
#
# USAGE:
#   ./scripts/manage_restserver.sh start|stop|restart
#
# VIEW:
#   http://localhost:8000

#cd /usr/local/system/projects/entos/external/workspace 

case $1 in
    "start" )
        echo "start python .restserver"
        nohup python ./backend/restserver.py > /tmp/nohup.out &
        ;;
    "stop" )
        echo "stop python restserver"
        kill `ps aux | grep "python ./backend/restserver.py" | grep -v grep | awk '{print $2}'` > /dev/null
        ;;
    "restart" )
        echo "restart python restserver"
        kill `ps aux | grep "python ./backend/restserver.py" | grep -v grep | awk '{print $2}'` > /dev/null 
        nohup python ./backend/restserver.py > /tmp/nohup.out &
        ;;
    *)
        echo "need start|stop|restart"
        exit 1
esac