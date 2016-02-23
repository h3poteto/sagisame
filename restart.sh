#!/bin/sh

login=0
char=0
map=0

if [ -e ./login-server.pid ] && ps $(cat ./login-server.pid) ; then
    login=$(cat ./login-server.pid)
fi

if [ -e ./char-server.pid ] && ps $(cat ./char-server.pid) ; then
    char=$(cat ./char-server.pid)
fi

if [ -e ./map-server.pid ] && ps $(cat ./map-server.pid) ; then
    map=$(cat ./map-server.pid)
fi

if [ $login -ne 0 ] ; then
    echo "kill login server"
    kill $login
fi

if [ $char -ne 0 ] ; then
    echo "kill char server"
    kill $char
fi

if [ $map -ne 0 ] ; then
    echo "kill map server"
    kill $map
fi
echo "starging all servers..."
sleep 3
./auriga-start start > log/start.log 2>&1
