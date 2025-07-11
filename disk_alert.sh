#!/bin/bash

THRESHOLD=80

# Corrected assignment (no spaces)
USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

DATE=$(date)
LOGFILE="/home/kedar/Desktop/DevOps/logs/disk_alerts.log"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "⚠️ Disk usage is ${USAGE}% on $(hostname) at $DATE" | tee -a "$LOGFILE"
else
  echo "✅ Disk usage OK (${USAGE}%) on $(hostname) at $DATE" >> "$LOGFILE"
fi

