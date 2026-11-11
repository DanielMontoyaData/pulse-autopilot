FROM python:3.11-slim
WORKDIR /opt/pulse
COPY PULSE_AUTOPILOT_v2_0.zip /tmp/pulse.zip
RUN python -c "import zipfile; zipfile.ZipFile('/tmp/pulse.zip').extractall('/opt/pulse')" \
 && pip install --no-cache-dir -r /opt/pulse/PULSE_platform_v1/requirements.txt
WORKDIR /opt/pulse/PULSE_platform_v1
ENV PYTHONUNBUFFERED=1
ENV PORT=8000
EXPOSE 8000
CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000}"]
