#!/data/data/com.termux/files/usr/bin/bash

echo "[💱] Latency offering initiated..."
while read latency; do
  if (( $(echo "$latency > 100" | bc -l) )); then
    echo "[⚠️] High latency: $latency ms — offering delayed."
  else
    echo "[🌀] Offering bound to latency: $latency ms"
  fi
done < ~/mesh/state/latency_trace.txt
echo "[🜛] Offering complete."
