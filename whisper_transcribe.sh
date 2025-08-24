#!/data/data/com.termux/files/usr/bin/bash

echo "🧠 Whisper transcription invoked..."

AUDIO_DIR="$HOME/mesh/audio"
OUTPUT_DIR="$HOME/mesh/docs/copilot_sessions"
mkdir -p "$OUTPUT_DIR"

for file in "$AUDIO_DIR"/*.wav; do
  base=$(basename "$file" .wav)
  transcript="$OUTPUT_DIR/${base}_transcript.txt"

  whisper "$file" --model tiny --output_dir "$OUTPUT_DIR" --output_format txt
  mv "$OUTPUT_DIR/$base.txt" "$transcript"

  echo "✅ Transcribed: $transcript"
done
