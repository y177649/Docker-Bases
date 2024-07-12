FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    openssh-client \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY id_rsa /root/.ssh/id_rsa
COPY id_rsa.pub /root/.ssh/id_rsa.pub
RUN chmod 600 /root/.ssh/id_rsa

RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

WORKDIR /workspace

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN echo '#!/bin/sh\nexec code-server --bind-addr 0.0.0.0:8080 /workspace' > /usr/local/bin/start-code-server && \
    chmod +x /usr/local/bin/start-code-server

CMD ["start-code-server"]

EXPOSE 8080
