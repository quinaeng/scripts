import datetime

# ログファイルを読み込んで、指定した時間範囲のログを別のファイルとして保存するスクリプト
start_time = "2024-05-01 13:30"
end_time = "2024-05-01 14:00"
input_file = "./log.txt"
output_file = "./output.txt"

s_time = datetime.datetime.strptime(start_time, "%Y-%m-%d %H:%M")
e_time = datetime.datetime.strptime(end_time, "%Y-%m-%d %H:%M")

# ファイルの時間部分を取得して時刻のデータ型に修正することができた
with open(input_file) as f, open(output_file, "a") as f2:

    for line in f:
        log_time = line.split()
        log_format = log_time[1] + ' ' + log_time[2]
        log_format1 = datetime.datetime.strptime(log_format, "%Y-%m-%d %H:%M")

        if  s_time <= log_format1 and log_format1 <= e_time:
            print(log_format1)
            msg = str(log_format1) + "\n"
            f2.write(msg)
        else:
            pass
