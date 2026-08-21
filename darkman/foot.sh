#!/bin/sh

# case "$1" in
# dark)
#   SIGNAL=SIGUSR1
#   ;;
# light)
#   SIGNAL=SIGUSR2
#   ;;
# esac
#
# # Try to signal the foot server first
# if pgrep -x foot >/dev/null; then
#   pkill -"${SIGNAL}" -x foot
# else
#   echo "foot server not running, signaling footclient instances..."
#   pkill -"${SIGNAL}" -x footclient 2>/dev/null
# fi
