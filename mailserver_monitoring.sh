#!/bin/bash
imapserver=[ip_or_dns]
smtpserver=[ip_or_dns]
smtpremoteport=25
imapremoteport=143
log_dir=/tmp/
DATE=`date '+%Y-%m-%dT%H:%M:%S'`

#####################################################
if [ "`echo | nc -w1 $smtpserver $smtpremoteport > /dev/null 2>&1 ; echo $?`" -le 0 ] ; then
    echo "`date '+%Y-%m-%d %H:%M:%S'` SUCCESSFULLY Connected to ${smtpserver}:${smtpremoteport}" >> $log_dir/maildriver.log
else
    echo "`date '+%Y-%m-%d %H:%M:%S'` Connection to ${smtpserver}:${smtpremoteport} is FAILED. Exit Code was ($?)." >> $log_dir/maildriver.log
fi
if [ "`echo | nc -w1 $imapserver $imapremoteport > /dev/null 2>&1 ; echo $?`" -le 0 ] ; then
    echo "`date '+%Y-%m-%d %H:%M:%S'` SUCCESSFULLY Connected to ${imapserver}:${imapremoteport}" >> $log_dir/maildriver.log
else
    echo "`date '+%Y-%m-%d %H:%M:%S'` Connection to ${imapserver}:${imapremoteport} is FAILED. Exit Code was ($?)." >> $log_dir/maildriver.log
fi
#####################################################
