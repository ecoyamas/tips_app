# メディアアプリ制作

## コンテナ起動
docker-compose up

## サーバー停止
docker-compose down

## railsコマンド
docker-compose run web railsコマンド

## bash
docker-compose run web bash

## DB接続
mysql -u root -p -h localhost -P 3306 --protocol=tcp
