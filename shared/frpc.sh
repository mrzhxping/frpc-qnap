#!/bin/sh
CONF=/etc/config/qpkg.conf
QPKG_NAME="frpc"
# frpc 安装路径
QPKG_ROOT=`/sbin/getcfg $QPKG_NAME Install_Path -f ${CONF}`

# frpc 配置文件路径 默认安装路径下的 frpc.ini
CONF_PATH=$QPKG_ROOT/$QPKG_NAME.ini
# frpc 日志文件 默认frpc.log
LOG_PATH=$QPKG_ROOT/$QPKG_NAME.log 

export QNAP_QPKG=$QPKG_NAME

case "$1" in
  start)
    ENABLED=$(/sbin/getcfg $QPKG_NAME Enable -u -d FALSE -f $CONF)
    if [ "$ENABLED" != "TRUE" ]; then
      echo "$QPKG_NAME is disabled."
      exit 1
    fi
    mkdir -p $QPKG_ROOT
    if [ -f $CONF_PATH ]; then
	   $QPKG_ROOT/frpc  -c $CONF_PATH > $LOG_PATH 2>&1 &
    else
      cat >$CONF_PATH <<EOF
[common]
server_addr = 127.0.0.1
server_port = 7000

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6000

EOF
      $QPKG_ROOT/frpc  -c $CONF_PATH > $LOG_PATH 2>&1 &
      
    fi
    ;;

  stop)
    killall -9 frpc
    ;;

  restart)
    $0 stop
    $0 start
    ;;

  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac

exit 0
