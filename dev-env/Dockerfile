FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    vim \
    curl \
    wget \
    gpg \
    apt-transport-https \
    libx11-xcb1 \
    libxkbfile1 \
    libsecret-1-0 \
    libxss1 \
    libasound2-data \
    libasound2-plugins \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libglib2.0-0 \
    software-properties-common

# VS Codeのインストール
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/ && \
    sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
    apt-get update && \
    apt-get install -y code

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install flask SQLAlchemy

ENV PATH="/opt/venv/bin:$PATH"

# SSHキーをコンテナにコピー (ホストのSSHキーをコンテナに追加する場合)
# ホスト側のSSHキーがこのDockerfileと同じディレクトリにあると仮定します。
COPY id_rsa /root/.ssh/id_rsa
COPY id_rsa.pub /root/.ssh/id_rsa.pub

# 適切なパーミッションを設定
RUN chmod 600 /root/.ssh/id_rsa

# GitHubのホストキーをknown_hostsに追加
RUN mkdir -p /root/.ssh && ssh-keyscan github.com >> /root/.ssh/known_hosts

# GitHubに初回接続してホストを確認（自動化）
RUN ssh -T git@github.com || true

WORKDIR /workspace