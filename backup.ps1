# 時間を取得
$NOW = Get-Date -UFormat %Y%m%d%H%m

# バックアップ先に格納されるzipファイル名
$BACKUP_FILE_NAME = "Backup_$NOW.zip"

# バックアップ対象のフォルダを指定
$SRC_DIR = "C:\Users\test\Desktop\dir1\src\dir1"

# バックアップ先のフォルダを指定
$DST_DIR = "C:\Users\test\Desktop\dir1\dst\"

# バックアップ対象のフォルダをzip化してバックアップ先のフォルダに格納する
Compress-Archive -Path $SRC_DIR -DestinationPath ${DST_DIR}${BACKUP_FILE_NAME}
