#!/bin/bash

echo "===== Server Performance Stats ====="
echo "Hostname   : $(hostname)"
echo "OS Version : $(uname -a)"
echo "Uptime     : $(uptime -p)"
echo "Date       : $(date)"
echo

echo "----- CPU Usage -----"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " 100 - $8 "% (used)"}'
echo

echo "----- Memory Usage -----"
free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
echo

echo "----- Disk Usage -----"
df -h --total | grep 'total' | awk '{printf "Used: %s / Total: %s (%s used)\n", $3, $2, $5}'
echo

echo "----- Top 5 Processes by CPU -----"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo

echo "----- Top 5 Processes by Memory -----"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo

echo "----- Load Average (1, 5, 15 min) -----"
uptime | awk -F'load average:' '{ print $2 }'
echo

echo "----- Logged in Users -----"
who || echo "No users logged in."
echo

echo "----- Failed Login Attempts -----"
if command -v lastb &> /dev/null; then
    lastb | head || echo "No failed login records."
else
    echo "Command 'lastb' not available on this system."
fi
echo
