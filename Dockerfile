# Use a base image with Python
FROM python:3.8

# Set the working directory
WORKDIR /app

# Install required tools
RUN apt-get update -y && \
    apt-get install -y wget curl

# Download and install cloudflared
RUN wget -q -nc https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /app/cloudflared && \
    chmod +x /app/cloudflared

# Copy Python script
COPY start_app.py /app/

# Install JupyterLab
RUN pip install jupyterlab

# Expose port 8080 for JupyterLab
EXPOSE 8080

# Run the Python script
CMD ["python", "start_app.py"]
