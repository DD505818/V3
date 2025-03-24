# === STAGE 1: Builder ===
FROM python:3.11-slim AS builder

WORKDIR /build

COPY requirements.txt .
RUN pip install --upgrade pip && pip wheel --no-cache-dir --wheel-dir /wheels -r requirements.txt

# === STAGE 2: Runtime ===
FROM python:3.11-slim AS runtime

WORKDIR /app

COPY --from=builder /wheels /wheels
COPY requirements.txt .
COPY . /app

RUN pip install --no-cache --no-index --find-links=/wheels -r requirements.txt

RUN chmod +x launch_vivi_ai.sh

RUN useradd -m viviuser
USER viviuser

CMD ["/bin/bash", "-c", "if [ ! -f .env ]; then python3 setup_env.py; fi && ./launch_vivi_ai.sh"]
