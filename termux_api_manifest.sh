#!/data/data/com.termux/files/usr/bin/bash

echo "📜 Scanning Termux API capabilities..."

API_DIR="$HOME/DriveSyncFiles/adbAutoSave/app/src/main/java/com/termux/api/apis"
LOG="$HOME/mesh/logs/termux_api_scan_$(date +%Y%m%d_%H%M%S).txt"

mkdir -p "$HOME/mesh/logs"

for file in "$API_DIR"/*.java; do
  api_name=$(basename "$file" .java)
  echo "✅ Found API: $api_name" >> "$LOG"
done

echo "📦 Scan complete. Log saved to: $LOG"
