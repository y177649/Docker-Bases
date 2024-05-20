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

CMD ["bash"]