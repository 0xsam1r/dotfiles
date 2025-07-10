#!/bin/bash

# Check if camera device exists
if [ ! -e /dev/video0 ]; then
  echo '{"text":"×","class":"disabled"}'
  exit 0
fi

# Check if camera is in use
if fuser /dev/video0 >/dev/null 2>&1; then
  echo '{"text":"󰄀","class":"active"}'
else
  echo '{"text":"󱦿","class":"inactive"}'
fi