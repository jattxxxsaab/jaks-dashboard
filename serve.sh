#!/bin/bash
# Simple HTTP server for STR Tracker
cd /Users/jimmy_mac_mini/.openclaw/workspace/projects/str-tracker
python3 -m http.server 8899 --bind 0.0.0.0
