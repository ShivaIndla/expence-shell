#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log


if [$USERID -ne 0]
then
    echo "PLease run this with root user!"
    exit 1
else
    echo " You are super user."
fi
