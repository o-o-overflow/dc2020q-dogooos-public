FROM python:3.7-alpine

ENV TERM linux

RUN apk update && apk add --no-cache git netcat-openbsd openssl-dev libffi-dev g++ linux-headers make bash

COPY requirements.txt /requirements.txt
RUN pip install -r requirements.txt

COPY round_rue_ninja.png /round_rue_ninja.png
COPY exploit1.py /exploit1.py

COPY check1.py /check1.py
COPY check2.py /check2.py

RUN chmod 777 /*.py


