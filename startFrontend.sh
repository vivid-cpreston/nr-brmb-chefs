#!/bin/bash
cd /app
./fillEnvValues.sh ./config/local.json
cd /app/frontend
npm install
npm run serve
