#!/bin/bash

FILE_LIST="./file_list.txt"
REPLACE_WORD="./params.txt"

cd $(dirname $0)

# 文字列置換を行う対象のファイルパスを取得
while read file_path
do

  # file_listのファイル有無を確認
  if [ -e "$file_path" ]; then

    # 置換前と置換後の文字を取得
    while read replace_word
    do
      before_word=$(echo $replace_word | cut -d":" -f1)
      after_word=$(echo $replace_word | cut -d":" -f2)

      # 文字列を置換する
      sed -i "s/$before_word/$after_word/g" $file_path
      echo "[OK]: $file_path"

    done < $REPLACE_WORD
  else
    echo "[NG]: No such file or directory: $file_path"
  fi
done < $FILE_LIST
