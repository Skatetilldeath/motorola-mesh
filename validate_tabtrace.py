import json
import os

path = os.path.expanduser("~/mesh/relay/echo_payload.json")

with open(path, "r") as f:
    data = json.load(f)

for entry in data:
    assert "tab_id" in entry, "Missing tab_id"
    assert "invoke" in entry, "Missing invoke block"
    assert all(k in entry["invoke"] for k in ["ritual", "emotion", "origin"]), "Incomplete invoke block"

print("✅ Validation passed. All entries aligned.")
