#!/data/data/com.termux/files/usr/bin/bash

echo "[🛡️] Unreachable sweep initiated..."
for ip in 192.168.1.{2..99}; do
  ping -c 1 -W 1 $ip > /dev/null || echo "[❌] $ip unreachable" >> ~/mesh/logs/unreachable.log
done
echo "[🜛] Sweep complete. Log saved to unreachable.log."
