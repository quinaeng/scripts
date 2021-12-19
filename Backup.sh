#!/bin/bash

#*******************************************************

# バックアップ対象のファイル及びディレクトリを指定する。
# ディレクトリを指定する場合は、最後の「/」は記載しないこと。
BACKUP_SOURCE[0]="/var/mail"
BACKUP_SOURCE[1]="/var/log/messages"

# バックアップ先のディレクトリを指定する。
BACKUP_DESTINATION="/root/work/backup"

# バックアップの世代数を指定する。
BACKUP_GENERATION=10

# バックアップ世代管理をサイズ(MByte)で指定する。(未実装)
# BACKUP_DATA_SIZE=

# バックアップデータのファイル名を指定する。
BACKUP_DATA_NAME="Backup"

#*******************************************************


# バックアップ対象の数を定義。
LENGTH=${#BACKUP_SOURCE[*]}

# スクリプトの実行日時を取得する。
DATETIME=`date "+%Y%m%d%H%M%S"`

# バックアップディレクトリにファイルコピーをコピーする。
COUNT=0
while [ $COUNT -lt $LENGTH ]
do

  rsync -avh ${BACKUP_SOURCE[$COUNT]} ${BACKUP_DESTINATION}
  COUNT=`expr ${COUNT} + 1`

done

cd ${BACKUP_DESTINATION}

# バックアップディレクトリにある現在のバックアップデータの世代数を変数に格納する。
LATEST_BACKUP_DATA=`ls | grep -E "${BACKUP_DATA_NAME}_[0-9]{14}.tar.gz" | wc -l`


# バックアップディレクトリのバックアップデータ数が世代管理数に満たない場合は、バックアップデータを作成する。
# バックアップ数が世代管理数以上の場合は、古いバックアップデータから削除する。

if [ ${LATEST_BACKUP_DATA} -lt ${BACKUP_GENERATION} ]; then

  ls | grep -Ev "^.*\.tar.gz$" | paste -s -d " " | sed -r "s/(.*)/tar zcvf ${BACKUP_DATA_NAME}_${DATETIME}.tar.gz \1 --remove-files/" | bash
  exit 0

else

  # 世代数以上のバックアップデータがある場合は削除する。
  ls -1 | grep -E [0-9]{8} | sort -gr | paste -s -d" " | cut -d" " -f`seq ${BACKUP_GENERATION} 1 ${LATEST_BACKUP_DATA} | paste -s -d","` | xargs rm -fr

  # バックアップを作成
  ls | grep -Ev "^.*\.tar.gz$" | paste -s -d " " | sed -r "s/(.*)/tar zcvf ${BACKUP_DATA_NAME}_${DATETIME}.tar.gz \1 --remove-files/" | bash
  exit 0

fi

# メモ
# バックアップデータの合計サイズが任意のサイズを超えた場合、そこでファイル削除とバックアップするという世代管理機能を後で追加する。
