#!/data/data/com.termux/files/usr/bin/bash

echo "[🌀] Test reflex initiated..."
targets=(192.168.1.1 192.168.1.100)

for ip in "${targets[@]}"; do
  echo "[🧬] Pinging $ip..."
  ping -c 1 $ip | grep 'time=' >> ~/mesh/logs/test_reflex.log
done

echo "[🜛] Test complete. Log saved to ~/mesh/logs/test_reflex.log"
