#!/bin/bash
cd /app
./fillEnvValues.sh ./config/local.json
cd /frontend
npm install
npm run serve
