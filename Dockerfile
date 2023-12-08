# Use a base image with Python
FROM python:3.8

# Set the working directory
WORKDIR /app

# Install required tools
RUN apt-get update -y && \
    apt-get install -y wget curl && \
    if [ ! -f cloudflared ]; then \
        wget -q -nc https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O cloudflared; \
        chmod +x cloudflared; \
    fi

# Install JupyterLab
RUN pip install jupyterlab

# Expose port 8080 for JupyterLab
EXPOSE 8080

# Start JupyterLab on port 8080
CMD ["sh", "-c", "jupyter lab --ip=0.0.0.0 --port=8080 --no-browser --allow-root & cloudflared tunnel --url http://127.0.0.1:8080 --metrics localhost:45678"]
