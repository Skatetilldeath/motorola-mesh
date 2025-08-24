#!/data/data/com.termux/files/usr/bin/bash
for ip in 192.168.1.1 192.168.1.100 192.168.1.102 192.168.1.103 192.168.1.104 192.168.1.106 192.168.1.114; do
  ping -c 1 $ip | grep 'time=' >> ~/mesh/logs/reflex_bot.log
done
