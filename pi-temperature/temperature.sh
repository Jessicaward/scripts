#!/bin/bash
date=$(date --iso-8601=seconds)
output=$(vcgencmd measure_temp)
temperature=$(echo "$output" | grep -o -E '[0-9]+\.[0-9]+' | awk '{ print $1 }')

if [ -z "$temperature" ]; then
	echo "[$date] Failed to read temperature for output: $output"
	exit 1
fi

echo "[$(date --iso-8601=seconds)] ${temperature}C" >> {PATH_TO_LOGFILE.txt}
