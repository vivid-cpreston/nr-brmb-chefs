#!/bin/bash
cd /chefs/app
./fillEnvValues.sh /app/config/local.json
npm install
npm run migrate
npm run seed:run
npm run serve
