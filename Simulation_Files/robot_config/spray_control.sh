#!/usr/bin/env bash

STATE_FILE="$HOME/spray_ws/robot_config/scripts/spray_state"

case "$1" in
    true)
        echo "on" > "$STATE_FILE"
        gz topic -t /spray_paint/trigger -m gz.msgs.Boolean -p 'data: true'
        echo "Spray ON — sweep enabled"
        ;;
    false)
        echo "off" > "$STATE_FILE"
        gz topic -t /spray_paint/trigger -m gz.msgs.Boolean -p 'data: false'
        echo "Spray OFF — sweep stopping"
        ;;
    *)
        echo "Usage: $0 true|false"
        exit 1
        ;;
esac
