# 基本操作

 - コンテナの一覧表示
```shell
docker ps -a
```

 - コンテナの起動
```shell
docker start -i コンテナ名

```
 - コンテナの終了
```shell
exit
```

## buildの際、ホストマシンのディレクトリをマウントする

```bash
docker run -it --name dev-env-container -v / マウントするディレクトリのフルパス /workspace dev-env
```

例
```bash
docker run -it --name dev-env-container -v /c/code:/workspace dev-env
```
