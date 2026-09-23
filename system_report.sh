#!/bin/bash

echo "===== SYSTEM HEALTH REPORT ====="

echo "Hostname       : $(hostname)"
echo "Current User   : $(whoami)"
echo "Kernel         : $(uname -r)"
echo "CPU Cores      : $(nproc)"
echo "Uptime         : $(uptime -p)"
echo "IP Address     : $(hostname -I | awk '{print $1}')"

echo ""
echo "===== MEMORY ====="
free -h

echo ""
echo "===== DISK ====="
df -h /

echo ""
echo "===== LOGGED-IN USERS ====="
who

echo ""
echo "===== TOP CPU PROCESSES ====="
ps -eo pid,user,comm,%cpu,%mem --sort=-%cpu | head

#This will create an alert when disk usage is greater than 80% 
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK_USAGE" -gt 80 ]; then
	    echo "WARNING: Disk usage is ${DISK_USAGE}%"
    else
	        echo "Disk usage OK: ${DISK_USAGE}%"
fi
