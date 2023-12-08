# start_app.py
import subprocess
import os

# Start JupyterLab
subprocess.Popen(['jupyter', 'lab', '--ip=0.0.0.0', '--port=8080', '--no-browser', '--allow-root'])

# Start cloudflared tunnel
subprocess.run(['/app/cloudflared', 'tunnel', '--url', 'http://127.0.0.1:8080', '--metrics', 'localhost:45678'])
