#/bin/bash

# description: Auto-starts boot

Jar=$(ls *.jar)
Log="server.log"
RETVAL="0"

# See how we were called.
function start() {
    echo  $Log 
    if [ ! -f $Log ]; then
        touch $Log
    fi
    nohup java -jar $Jar > $Log 2>&1 &  
    echo $! > server.pid
    #tail -f $Log
}


function stop() {
    pid=`cat server.pid`
    if [ "$pid" != "" ]; then      
        echo -n "boot ( pid $pid) is running" 
        echo 
        kill "$pid"
        echo -n $"Shutting down boot: "

        pid2=$(ps -ef | grep -v 'grep' | grep "$Jar"| awk '{printf $2 " "}')
        if [ "$pid" == "$pid2" ]; then
            echo "kill boot process"
            kill -9 "$pid"
        fi
        else 
             echo "boot is stopped" 
        fi

    status
}

function status()
{
    pid=$(ps -ef | grep -v 'grep' | grep $Jar| awk '{printf $2 " "}')
    #echo "$pid"
    if [ "$pid" != "" ]; then
        echo "boot is running,pid is $pid"
    else
        echo "boot is stopped"
    fi
}



function usage()
{
   echo "Usage: $0 {start|stop|restart|status}"
   RETVAL="2"
}

# See how we were called.
RETVAL="0"
case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    reload)
        RETVAL="3"
        ;;
    status)
        status
        ;;
    *)
      usage
      ;;
esac

exit $RETVAL
