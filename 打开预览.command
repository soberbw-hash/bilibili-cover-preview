#!/bin/zsh

cd "$(dirname "$0")" || exit 1

PORT=8765
URL="http://127.0.0.1:${PORT}/index.html"
LOG_FILE="/tmp/bilibili-cover-preview.log"

if ! lsof -ti tcp:${PORT} >/dev/null 2>&1; then
  python3 -m http.server "${PORT}" > "${LOG_FILE}" 2>&1 &
  sleep 0.6
fi

open "${URL}"
