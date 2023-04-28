#!/bin/bash
cd /app
./fillEnvValues.sh ./config/local.json
npm install
npm run migrate
npm run seed:run
npm run serve