# ---- Build stage ----
FROM python:3.12-slim AS builder

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

COPY app/ .

# ---- Final stage ----
FROM python:3.12-slim

WORKDIR /app

# Copy installed packages and app code from builder stage
COPY --from=builder /root/.local /root/.local
COPY --from=builder /app /app

ENV PATH=/root/.local/bin:$PATH

EXPOSE 5000

# Run as a non-root user for better security
RUN useradd -m appuser
USER appuser

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
