# 家計簿アプリ

## コンテナ作成
docker-compose up

## コンテナ起動
docker-compose start

## コンテナ終了
docker-compose stop

##コンテナ削除
docker-compose down

## railsコマンド
docker-compose run web railsコマンド

## bash
docker-compose run web bash

## DB接続
mysql -u root -p -h localhost -P 3306 --protocol=tcp

## モデル作成コマンド
rails generate model モデル名

## マイグレーションの適用
rails db:migrate

## マイグレーションファイルのロールバック
rails db:rollback

## DB作成
rake db:create
