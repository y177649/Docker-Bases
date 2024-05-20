FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    vim \
    curl

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install flask SQLAlchemy

ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /workspace

CMD ["bash"]