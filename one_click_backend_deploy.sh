#!/bin/bash
echo 'Starting backend deployment'
source venv/bin/activate
pip install -r requirements.txt
nohup python3 main.py > logs/api.log 2>&1 &
nohup python3 arbitrage_agent.py > logs/arbitrage.log 2>&1 &
nohup python3 sentiment_manipulation_agent.py > logs/sentiment.log 2>&1 &
echo 'Backend deployment completed!'
