FROM ubuntu:latest

LABEL maintainer="github.com/y177649"

RUN apt-get update && apt-get indtall -y \
    curl \
    vim \
    git \
    python3 \
    pytthon3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir flask-sqlalchemy

ENV MY_ENVIRONMENT_VAR /path/to/environment

WORKDIR /usr/src/app

CMD ["echo", "Hello World"]