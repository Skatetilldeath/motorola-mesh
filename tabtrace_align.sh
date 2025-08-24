#!/bin/bash
INPUT=~/mesh/trace/tabtrace_aug13_matrix.json
OUTPUT=~/mesh/relay/echo_payload.json

jq 'map({
  tab_id: .tab_id,
  invoke: {
    ritual: .ritual_type,
    emotion: .emotional_tag,
    origin: .node_origin
  }
})' "$INPUT" > "$OUTPUT"

echo "✅ Alignment complete. Payload ready for echo relay."
