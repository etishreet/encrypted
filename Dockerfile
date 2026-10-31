FROM python:3.11-slim
WORKDIR /app
COPY web /app/web
EXPOSE 8065
CMD ["python", "web/server.py"]
