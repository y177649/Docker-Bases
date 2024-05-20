FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    vim \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv

RUN . /opt/venv/bin/activate && \
    pip install flask flask-sqlalchemy

WORKDIR /workspace