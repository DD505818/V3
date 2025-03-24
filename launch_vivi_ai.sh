#!/bin/bash

echo "🚀 Launching Vivi AI v3.1 Full Stack Deployment..."

# Step 1: Backend Deployment (Docker)
echo "[1/3] Starting backend services..."
docker-compose -f docker-compose.yml up -d --build

# Step 2: Frontend Vercel build (requires Vercel CLI installed and configured)
echo "[2/3] Deploying frontend dashboard to Vercel..."
cd frontend
npm install
npm run build
npx vercel deploy --prod --yes
cd ..

# Step 3: Logs & Status
echo "[3/3] Backend logs (tailing last 10 lines)..."
docker logs --tail 10 vivi-ai

echo "✅ Vivi AI v3.1 is LIVE!"
echo "🌐 Access Dashboard: http://localhost:8501 or check your Vercel project link"
