FROM python:3.11-slim

# 1. Create app directory
WORKDIR /app

# 2. Install system dependencies if needed
# RUN apt-get update && apt-get install -y build-essential

# 3. Copy requirement files, install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy your project source
COPY . .

# 5. Expose the port where your app listens (e.g. 8080 or 8000)
EXPOSE 8080

# 6. Make start script executable
RUN chmod +x start.sh

# 7. Provide a healthcheck script (optional but recommended)
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s CMD curl -f http://localhost:8080/health || exit 1

# 8. Launch the app
CMD ["bash", "./start.sh"]
