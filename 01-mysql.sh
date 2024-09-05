#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
RED="\e[31m"
GREEN="\e[32m"
NORMAL="\e[0m"

VALIDATE(){ 

    if [ $1 -eq 0 ]
    then
        echo -e " $GREEN $2  is allready installed  $Yellow ....Skipping $NORMAL"
        echo "==================***=========================="
    else
        echo "installing $2 "
        dnf install $2 -y
        if [ $? -eq 0 ]
        then 
            echo -e "Instalation of $Yellow $2 $NORMAL is $GREEN ....Success $NORMAL"
            echo "==================***=========================="
        else
            echo -e "$RED error Please check the command $NORMAL" 

            echo "==================***=========================="
        fi
    fi
}


if [ $USERID -ne 0 ]
then
    echo "PLease run this with root user!"
    exit 1
else
    echo " You are super user."
fi

for i in $@
do
 echo -e "Package is about to install: $GREEN $i $NORMAL"
 dnf list installed $i
VALIDATE $? $i
done