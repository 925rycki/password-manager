#!/bin/bash

# パスワードを保存するファイルのパスを設定
FILEPATH="passwords.txt"

echo "パスワードマネージャーへようこそ！"

echo "サービス名を入力してください："
read service_name

echo "ユーザー名を入力してください："
read username

echo "パスワードを入力してください："
read password

echo "Thank you!"

# ファイルに情報を追記
echo "${service_name}:${username}:${password}" >> $FILEPATH
