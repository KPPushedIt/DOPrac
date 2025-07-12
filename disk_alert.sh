#!/bin/bash

THRESHOLD=80  # Set disk usage threshold
DATE=$(date)
HOST=$(hostname)

# Create a relative log directory that works in CI or local
LOGDIR="./logs"
mkdir -p "$LOGDIR"

LOGFILE="$LOGDIR/disk_alerts.log"

# Get root partition usage (as number, no % symbol)
USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

# Evaluate disk usage
if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "⚠️ Disk usage is ${USAGE}% on $HOST at $DATE" | tee -a "$LOGFILE"
else
  echo "✅ Disk usage OK (${USAGE}%) on $HOST at $DATE" >> "$LOGFILE"
fi

