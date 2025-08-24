#!/data/data/com.termux/files/usr/bin/bash

echo "[🌀] Glyph fallback initiated..."
if [ -s ~/mesh/logs/unreachable.log ]; then
  echo "[🧬] Unreachable IPs detected:"
  cat ~/mesh/logs/unreachable.log
  echo "[🜛] Fallback glyphs bound to unreachable echoes."
else
  echo "[✅] All IPs reachable. No fallback needed."
fi
