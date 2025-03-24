# Dockerfile for Vivi AI v3.1

FROM python:3.11-slim

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

RUN chmod +x launch_vivi_ai.sh

CMD ["./launch_vivi_ai.sh"]
