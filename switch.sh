#!/bin/bash

HEAD="TXP:0,0,10,5600,350,25,"
hi="3,1,3,1,"
lo="3,3,1,1,"
on="1,3,1,3,3,"
off="3,1,1,3,1,"
TAIL="1,1,16,"

ip="xxx.xxx.xxx.xxx"

get_id() {

    if [ ${#1} -ne 5 ] ;then
      echo "$2 code must have 5 digits"
      exit 1
    fi

    id=""

    for i in $(seq 0 4)
    do
      if [ "${1:$i:1}" = "1" ] ;then
        id=${id}${hi}
      elif [ "${1:$i:1}" = "0" ] ;then
        id=${id}${lo}
      else
        echo "Invalid character in $1"
        exit 1
      fi
    done

    eval "$2=${id}"

}

system=''
unit=''

get_id $1 system
get_id $2 unit

if [ "$3" = "on" ] ;then
   state=${on}
   statename=on
elif [ "$3" = "off" ] ;then
   state=${off}
   statename=off
else
   echo 'Third argument must be either "on" or "off".'
   exit 1
fi

echo "${HEAD}1,${system}${unit}3,${state}${TAIL};" | nc -w 1 -u $ip 49880

echo "Switched to ${statename}"
