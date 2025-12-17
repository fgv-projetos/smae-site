#!/bin/sh
exec 2>&1
cd /app
exec /sbin/setuser www-data node .output/server/index.mjs