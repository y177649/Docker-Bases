FROM ubuntu:latest

LABEL maintainer="github.com/y177649"

RUN apt-get update && apt-get indtall -y \
    curl \
    vim \
    git \
    && rm -rf /var/lib/apt/lists/*

ENV MY_ENVIRONMENT_VAR /path/to/environment

WORKDIR /usr/src/app

CMD ["echo", "Hello World"]