@echo off

set SOURCE="C:\Users\user\Desktop\src"
set DESTINATION="C:\Users\users\Desktop\dst"
set LOG="%~dp0data_migration.log"

rem /MIR ディレクトリ ツリーをミラー化します (/E および /PURGE と同等)。
rem /MT  n個のスレッドのマルチスレッド コピーを実行します。
rem /E   空のディレクトリを含むサブディレクトリをコピーします。
rem /COMPRESS ファイル転送中にネットワーク圧縮を要求します
rem /COPY コピーする情報(D=データ、A=属性、T=タイムスタンプ、X=代替データ ストリームをスキップ、S= セキュリティ =NTFS ACL、O= 所有者情報、U= 監査情報)。
rem /LOG+  ログ ファイルに状態を出力します

robocopy %SOURCE% %DESTINATION% /MIR /MT:%NUMBER_OF_PROCESSORS% /E /COMPRESS /COPY:DATSOU /LOG+:%LOG%
