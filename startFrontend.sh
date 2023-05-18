#!/bin/bash
cd /chefs/app
./fillEnvValues.sh ./config/local.json
cd /chefs/app/frontend
npm install
npm run serve
