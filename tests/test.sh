#!/bin/sh

echo "⏳ Waiting for web container..."
sleep 5

apk add --no-cache curl

echo "🔍 Running integration test..."

response=$(curl -s http://web)

if echo "$response" | grep -q "DevOps App"; then
  echo "✅ Test Passed"
  exit 0
else
  echo "❌ Test Failed"
  exit 1
fi