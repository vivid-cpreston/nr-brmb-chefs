#!/bin/bash
cd /app/frontend
./fillEnvValues.sh ./config/local.json
npm install
npm run serve
