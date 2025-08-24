#!/data/data/com.termux/files/usr/bin/bash

echo "🔍 Termux Repo Validation — $(date)"
echo "--------------------------------------"

# A. Check active repo sources
echo "📦 Active sources:"
cat $PREFIX/etc/apt/sources.list

# B. Check plugin status
echo -e "\n🔌 Installed Termux plugins:"
for plugin in termux-api termux-styling termux-nix termux-tools; do
  if apt list --installed 2>/dev/null | grep -q "$plugin"; then
    echo "✅ $plugin installed"
  else
    echo "⚠️ $plugin missing"
  fi
done

# C. Check repo health
echo -e "\n🧪 Running update check..."
apt update -y && echo "✅ Repo reachable" || echo "❌ Repo unreachable"

# 1. Echo SE context
echo -e "\n🔐 SE Context:"
echo "$TERMUX__SE_PROCESS_CONTEXT"

# 2. Emotional trace
echo -e "\n🧠 Emotional Trace Capsule:"
echo "\"Repo validated. Plugins scanned. Mesh purity affirmed. $(date)\""
