@echo off
REM 打开终端
start cmd /k

REM 等待终端打开
timeout /t 1 >nul

REM 执行 go build 命令
go build -o app.exe

REM 等待编译完成
timeout /t 1 >nul

set n=%1


set z=%2

set server1=%3

set server2=%4

set server3=%5

set server4=%6

set server5=%7

set Cluster=%8

python CreateNodeTable.py %n% %server1% %server2% %server3% %server4% %server5%

REM 调用另一个 Python 脚本，传递 Cluster 和 startNode 变量的值
python CreateWindows.py %Cluster% %n% %z%

pause
