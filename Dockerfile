FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY vivi_env_init /vivi-env-init
RUN pip install -e /vivi-env-init

COPY . .

RUN chmod +x launch_vivi_ai.sh start.sh

CMD ["bash", "./start.sh"]