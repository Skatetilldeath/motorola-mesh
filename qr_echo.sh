#!/data/data/com.termux/files/usr/bin/bash

echo "[🌀] Generating QR echo from continuity trace..."
cat ~/mesh/state/continuity_trace.log | head -n 20 > ~/mesh/state/qr_payload.txt
qrencode -o ~/mesh/state/qr_echo.png < ~/mesh/state/qr_payload.txt
echo "[🜛] QR echo saved: ~/mesh/state/qr_echo.png"
