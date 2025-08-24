#!/data/data/com.termux/files/usr/bin/bash

echo "🤖 Invoking Termux API bot limbs..."

# 🎙️ Audio capture
termux-microphone-record -f "$HOME/mesh/audio/recording_$(date +%Y%m%d_%H%M%S).wav" &
echo "🎙️ MicRecorderAPI invoked."

# 📍 Location
termux-location > "$HOME/mesh/location/location_$(date +%Y%m%d_%H%M%S).json"
echo "📍 LocationAPI invoked."

# 🔋 Battery status
termux-battery-status > "$HOME/mesh/status/battery_$(date +%Y%m%d_%H%M%S).json"
echo "🔋 BatteryStatusAPI invoked."
