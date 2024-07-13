docker exec -it dev-env-code-server-1 /bin/bash# 開発環境のセットアップ

このドキュメントでは、Dockerfileとdocker-compose.ymlを使用して開発環境をセットアップする手順を説明します。

## 手順

1. リポジトリをクローンします。

    ```sh
    git clone <リポジトリのURL>
    cd <クローンしたリポジトリのディレクトリ>
    ```

2. プロジェクトのルートディレクトリで以下のコマンドを実行して、必要なディレクトリを作成します。

    ```sh
    mkdir -p ./workspace
    ```

3. Dockerイメージをビルドします。

    ```sh
    docker-compose build
    ```

4. コンテナを起動します。

    ```sh
    docker-compose up -d
    ```

5. ブラウザで以下のURLにアクセスします。

    ```
    http://localhost:8082
    ```

6. コンテナにシェルアクセスする必要がある場合は、以下のコマンドを実行します。

    ```sh
    docker exec -it dev-env-code-server-1 /bin/bash
    ```