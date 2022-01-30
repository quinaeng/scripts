#!/bin/bash

# command_listに定期的に実行したいコマンドを追加する。
# コマンドの実行間隔をINTERVALに定義する。単位は秒。
# ログアウト後も実行する場合は、「nohup bash resource_watch.sh &」で実行する。

INTERVAL=3

function command_list() {
	date
	free -h
	lsblk
	df -h
	ss -atup
	ps aux
}

while true;
do
	command_list >> watch.log
	sleep ${INTERVAL}
done

