#!/bin/bash
echo ""
echo -e "Enter the Date, Use Double Space for date from 1 to 9 (Nov  3) and use Single Space for date from 10 to 31 (Nov 30): \c"
read yday
MYPATH=/var/log/secure*
tuser=$(grep "$yday" $MYPATH | grep "Accepted|Failed" | wc -l)
suser=$(grep "$yday" $MYPATH | grep "Accepted password|Accepted publickey|keyboard-interactive" | wc -l)
fuser=$(grep "$yday" $MYPATH | grep "Failed password" | wc -l)
scount=$(grep "$yday" $MYPATH | grep "Accepted" | awk '{print $9;}' | sort | uniq -c)
fcount=$(grep "$yday" $MYPATH | grep "Failed" | awk '{print $9;}' | sort | uniq -c)
echo "--------------------------------------------"
echo "       User Access Report on: $yday"
echo "--------------------------------------------"
echo "Number of Users logged on System: $tuser"
echo "Successful logins attempt: $suser"
echo "Failed logins attempt: $fuser"
echo "--------------------------------------------"
echo -e "Success User Details:\n $scount"
echo "--------------------------------------------"
echo -e "Failed User Details:\n $fcount"
echo "--------------------------------------------"
