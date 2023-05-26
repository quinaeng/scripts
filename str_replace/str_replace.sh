#!/bin/bash

FILE_LIST="./file_list.txt"
REPLACE_WORD="./params.txt"

cd $(dirname $0)


# 文字列置換を行う対象のファイルパスを取得
while read file_path
do

  # コメントアウト機能
  if [[ $file_path == \#* ]]; then
  	continue
  fi

  # file_listのファイル有無を確認
  if [ -e "$file_path" ]; then

    # 置換前と置換後の文字を取得
    while read replace_word
    do

      # コメントアウト機能
      if [[ $replace_word == \#* ]]; then
        continue
	    fi

      before_word=$(echo $replace_word | cut -d":" -f1)
      after_word=$(echo $replace_word | cut -d":" -f2)

	    grep -q "$before_word" $file_path
	    bw_exists=$?

      # 文字列を置換する
      sed -i 's|'"$before_word"'|'"$after_word"'|g' $file_path

	    # ログ出力
      if [ $bw_exists = 0 ]; then
        echo "File Path: $file_path" | tee -a result.txt
        echo "Before word: $before_word" | tee -a result.txt
        echo "After word: $after_word" | tee -a result.txt
        echo "---" | tee -a result.txt
      fi

    done < $REPLACE_WORD
  else
    echo "[NG]: No such file or directory: $file_path"
  fi
done < $FILE_LIST
