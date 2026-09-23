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
