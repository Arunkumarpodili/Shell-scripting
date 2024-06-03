#!/bin/bash 


UID=$(id -u)
DATE=$(date +"%F-%H-%M")
#log file is to track the output of the command, file name generated using DATE formate
LOG_FILE=$DATE
if [ $UID -ne 0 ]
then
        echo "User is not root"
        exit 12
else
        echo "User is root"
fi
VALIDATE(){
   if [ $1 -ne 0 ]
   then
       echo "$2 ----Failed"
       exit 1
   else
       echo "$2 -----success"
   fi
}
apt install git -y &>>$LOG_FILE
VALIDATE $? "Git installation is"
apt install wget -y &>>$LOG_FILE
VALIDATE $? "wget installation is"
apt install vim -y &>>$LOG_FILE
VALIDATE $? "vim installation is"
