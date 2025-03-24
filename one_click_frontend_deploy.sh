#!/bin/bash
echo 'Deploying frontend dashboard'
npm install
npm run build
npx vercel deploy --prod
echo 'Frontend deployment completed successfully'
