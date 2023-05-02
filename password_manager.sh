#!/bin/bash

# パスワードを保存するファイルのパスを設定
FILEPATH="passwords.txt"

add_password() {
  echo -n "サービス名を入力してください："
  read service_name

  echo -n "ユーザー名を入力してください："
  read username

  echo -n "パスワードを入力してください："
  read password

  # ファイルに情報を追記
  echo "${service_name}:${username}:${password}" >> $FILEPATH

  echo "パスワードの追加は成功しました。"
}

get_password() {
  echo -n "サービス名を入力してください："
  read service_name

  result=$(grep $service_name $FILEPATH)

  if [ "$result" != "" ]; then
    IFS=':' read -ra parts <<< "$result"

    echo "サービス名：${parts[0]}"
    echo "ユーザー名：${parts[1]}"
    echo "パスワード：${parts[2]}"
  else
    echo "そのサービスは登録されていません。"
  fi
}

exit() {
  echo "Thank you!"
  break
}


echo "パスワードマネージャーへようこそ！"

while true
do
  echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit)："

  read service

  if [ "$service" = "Add Password" ]; then
    add_password
  elif [ "$service" = "Get Password" ]; then
    get_password
  elif [ "$service" = "Exit" ]; then
    exit
  else
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  fi
done