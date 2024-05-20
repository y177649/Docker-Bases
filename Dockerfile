# ベースイメージとしてUbuntuを使用
FROM ubuntu:latest

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    vim \
    curl

# 仮想環境を作成
RUN python3 -m venv /opt/venv

# 仮想環境をアクティブにし、必要なPythonライブラリをインストール
RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install flask SQLAlchemy

# 環境変数を設定して仮想環境をデフォルトのPythonとして使用
ENV PATH="/opt/venv/bin:$PATH"

# 作業ディレクトリを設定
WORKDIR /workspace

# コンテナ起動時のコマンドを設定
CMD ["bash"]
