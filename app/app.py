from flask import Flask, jsonify
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST
import time

app = Flask(__name__)

REQUEST_COUNT = Counter('app_requests_total', 'Total number of requests to the app')


@app.route('/')
def home():
    REQUEST_COUNT.inc()
    return jsonify({
        "message": "Hello from the DevOps demo app!",
        "status": "running",
        "timestamp": time.time()
    })


@app.route('/health')
def health():
    return jsonify({"status": "healthy"}), 200


@app.route('/metrics')
def metrics():
    return generate_latest(), 200, {'Content-Type': CONTENT_TYPE_LATEST}


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
