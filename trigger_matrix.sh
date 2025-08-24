#!/data/data/com.termux/files/usr/bin/bash

source ~/mesh/config/api_keys.env

echo "🔁 Triggering bot payloads from echo matrix..."

PAYLOAD=$(cat ~/mesh/relay/echo_payload.json)

MESSAGE="⚡ Triggered at $(date)\n🧠 Emotion: ${EMOTION_TAG}\n📦 Payload: $(echo $PAYLOAD | jq -c '.')"

RESPONSE=$(curl -s -X POST $BOT_ENDPOINT \
  -H "Content-Type: application/json" \
  -d "{\"chat_id\":\"${NODE_ID}\",\"text\":\"${MESSAGE}\"}")

OK=$(echo "$RESPONSE" | jq -r '.ok')
DESC=$(echo "$RESPONSE" | jq -r '.description')

mkdir -p ~/mesh/trace

if [ "$OK" == "true" ]; then
  echo "[✓] Trigger executed at $(date)" >> ~/mesh/trace/bot_trigger.log
  echo "[✓] Endpoint used: $BOT_ENDPOINT" >> ~/mesh/trace/bot_trigger.log
  echo "[✓] Emotion: $EMOTION_TAG" >> ~/mesh/trace/bot_trigger.log
  echo "[✓] Node ID: $NODE_ID" >> ~/mesh/trace/bot_trigger.log
  echo "[✓] Response: $RESPONSE" >> ~/mesh/trace/bot_trigger.log
else
  echo "[✗] Trigger failed at $(date)" >> ~/mesh/trace/error.log
  echo "[✗] Endpoint: $BOT_ENDPOINT" >> ~/mesh/trace/error.log
  echo "[✗] Node ID: $NODE_ID" >> ~/mesh/trace/error.log
  echo "[✗] Error: $DESC" >> ~/mesh/trace/error.log
  echo "$RESPONSE"
fi
