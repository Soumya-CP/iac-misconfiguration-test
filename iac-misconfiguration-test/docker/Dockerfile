FROM python:3.12-slim
WORKDIR /app
COPY . /app
# TESTCASE: IAC-025 Dockerfile explicitly switches to root user
USER root
CMD ["python", "-c", "print('static scanner fixture')"]
