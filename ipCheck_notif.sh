#!/bin/zsh
CACHE_FILE=~/bin/.ip_cache
CURRENT_IP=$(curl -Ls ipconfig.me)

if [[ -f $CACHE_FILE ]]; then
  LAST_IP=$(cat $CACHE_FILE)
else
  LAST_IP=""
fi

if [[ "$LAST_IP" != "$CURRENT_IP" ]]; then
  # Native macOS notification
  terminal-notifier -message "New IP: $CURRENT_IP" -title "IP Changed" -sound default
  # does not work - could be my weird terminal or something
  # osascript -e "display notification \"New IP: $CURRENT_IP\" with title \"IP Changed\""
  echo "$CURRENT_IP" > $CACHE_FILE
fi

