#!/bin/bash
set -e

echo "[INIT] Bootstrapping environment with vivi-env-init..."
vivi-env-init

echo "[START] Vivi AI Bot Launch Sequence"
./launch_vivi_ai.sh