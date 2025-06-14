#!/bin/bash

# Set log file path (use /var/log/syslog or /var/log/messages based on your distro)
LOG_FILE="/var/log/syslog"
# Error keywords to look for
KEYWORDS="CRITICAL|ERROR|FAIL|panic"
# Temp file to store the results
TEMP_FILE="/tmp/log_alerts.txt"

# Get recent critical log entries (last 10 minutes)
echo "==== Critical Logs from $LOG_FILE ====" > "$TEMP_FILE"
grep -E "$KEYWORDS" "$LOG_FILE" | tail -n 20 >> "$TEMP_FILE"

# If errors found, email the output (customize 'you@example.com')
if [ -s "$TEMP_FILE" ]; then
    mail -s "íº¨ System Log Alert on $(hostname)" you@example.com < "$TEMP_FILE"
fi
