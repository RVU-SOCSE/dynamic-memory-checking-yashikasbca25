#!/bin/bash
INTERVAL=5
echo "Starting Memory Monitor... Press [CTRL+C] to stop."
echo "--------------------------------------------------"
while true; do
clear
TOTAL=$(free -m | awk '/Mem:/ {print $2}')
USED=$(free -m | awk '/Mem:/ {print $3}')
AVAILABLE=$(free -m | awk '/Mem:/ {print $7}')
USAGE_PERCENT=$(awk "BEGIN {printf \"%.2f\", ($USED/$TOTAL)*100}")
echo "TIMESTAMP: $(date '+%Y-%m-%d %H:%M:%S')"
echo "--------------------------------------------------"
echo "Total Memory:     $TOTAL MB"
echo "Current Usage:    $USED MB ($USAGE_PERCENT%)"
echo "Available Memory: $AVAILABLE MB"
echo "--------------------------------------------------"
echo "Top 5 Processes by Memory Usage:"
top -b -o +%MEM -n 1 | head -n 12 | tail -n 6
sleep $INTERVAL
done
