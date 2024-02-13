#!/bin/bash

# Set the idle timeout (in seconds)
IDLE_TIMEOUT=900  # 5 seconds for testing (adjust as needed)

# Lock screen command
LOCK_CMD="swaylock -f -c 000000"  # Customize the lock screen appearance

# Suspend command
SUSPEND_CMD="systemctl suspend"

# Execute swayidle
swayidle \
    timeout $IDLE_TIMEOUT "$LOCK_CMD; $SUSPEND_CMD"

