#!/bin/bash
# a simple chat program
# two people can chat connected to the same machine

#initialize timer
touch TIME

# variables
COUNTER=1
TIME_FORMAT="%H%M%S%N"
#TIME_CUR="$(date -r TIME +$TIME_FORMAT)"
#TIME_CUR="$(NOW )"
USER_1="usr1.txt"
USER_2="usr2.txt"

NOW()
{
echo "$(date -r TIME +$TIME_FORMAT)"
}
TIME_CUR="$(NOW )"
echo "$TIME_CUR"
USER()
{
        if [ $1 -eq 1 ]; then
                 echo "$USER_1"
        elif [ $1 -eq 2 ]; then
                echo "$USER_2"
        fi
}


TIME_N()
{
        U="$(USER $1)"
        echo "$(date -r $U +$TIME_FORMAT)"
}


CHAT_N()
{
        U="$(USER $1)"
        MESSAGE="$(cat $U)"
        echo "$COUNTER -- USER: $1  -- $MESSAGE"
        ((COUNTER++))
}

# print previous conversation
CHAT_N 1
CHAT_N 2
echo "Start conversation"

# enter conversation loop
while :
do
        CHANGE=false
        # check for conversation
        T1="$(TIME_N 1)"
        T2="$(TIME_N 2)"
        if [ "$T1" -gt "$TIME_CUR" ]
        then
                CHAT_N 1
                CHANGE=true
        fi
        if [ "$T2" -gt "$TIME_CUR" ]
        then
                CHAT_N 2
                CHANGE=true
        fi
        # update timer
        if [ "$CHANGE" = true ]
        then
                touch TIME
                TIME_CUR="$(NOW )"
        fi

# delay
sleep 1

done
