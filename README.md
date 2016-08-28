# Dark ISUCON

## ポータルサイト
http://isuconga.waka.ru.com/dashboard/db/dark-isucon?panelId=1&fullscreen

## ベンチマークの方法
ベンチマーク時にポータルサイトにスコアを投げるようにする


### 初期設定
以下、ベンチマーク用インスタンスでの作業手順

#### 1. `curl` と `jq` を入れる
```
# apt install curl jq
```
#### 2. `bench.sh` を落としてきて実行権限をつける
```
$ curl -O https://raw.githubusercontent.com/ngineerxiv/ISUCON/master/bench.sh
$ chmod +x ./bench.sh
```

#### 3. `bench.sh` を編集して「チーム名」と「競技用インスタンスIP」を設定する
```
TEAM_NAME="xxxxx"
TARGET_IP="xx.xx.xx.xx"
```

### ベンチマーク実行
ベンチマークが通れば(pass=true)ポータルサイトへスコアが登録される
```
$ ./bench.sh
```
