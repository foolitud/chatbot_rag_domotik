FROM python:3.11-alpine

WORKDIR /app

COPY requirement.txt /app

RUN pip install --no-cache-dir -r requirement.txt

COPY . /app

EXPOSE 8000