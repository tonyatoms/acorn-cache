#!/bin/bash
# Weather script with caching
# Usage: weather.sh [location]

if [ -z "$1" ]; then
    # No location specified, use IP-based location
    LOCATION=""
else
    # Use provided location
    LOCATION="/$1"
fi

CACHE_FILE="/tmp/weather_cache_${LOCATION// /_}"
CACHE_MAX_AGE=1800  # 30 minutes in seconds

# Check if cache exists and is recent enough
if [ -f "$CACHE_FILE" ]; then
    CACHE_TIME=$(stat -f "%m" "$CACHE_FILE")
    CURRENT_TIME=$(date +%s)
    CACHE_AGE=$((CURRENT_TIME - CACHE_TIME))
    
    if [ $CACHE_AGE -lt $CACHE_MAX_AGE ]; then
        # Cache is fresh, use it
        cat "$CACHE_FILE"
        exit 0
    fi
fi

# Cache doesn't exist or is too old, fetch new data
weather=$(curl -s "wttr.in${LOCATION}?format=%c+%t+feels+like+%f" 2>/dev/null | tr -d '%')

# If curl fails, use a default value
if [ -z "$weather" ]; then
  weather="? --°C feels like --°C"
fi

# Store in cache
echo "$weather" > "$CACHE_FILE"

# Output the weather
echo "$weather"