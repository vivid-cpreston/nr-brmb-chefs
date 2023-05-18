#!/bin/bash
cd /app/frontend
cp ../config/local.json ./local.json
./fillEnvValues.sh ./config/local.json
npm install
npm run serve
