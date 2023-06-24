#!/bin/bash

# 获取脚本工作目录绝对路径
export Server_Dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# 加载env变量文件
source $Server_Dir/env

# 获取 CLASH_MODE 值，赋值给 MODE，判断脚本执行模式，root权限还是用户模式
MODE=${CLASH_MODE:-user}
if [[ $MODE != 'user' && $MODE != 'root' ]]; then
    MODE='user'
    echo '未指定或错误填写MODE，已默认为user模式'
fi

# 关闭clash服务
PID_NUM=`ps -ef | grep [c]lash-linux-a | wc -l`
PID=`ps -ef | grep [c]lash-linux-a | awk '{print $2}'`
if [ $PID_NUM -ne 0 ]; then
    kill -9 $PID
    # ps -ef | grep [c]lash-linux-a | awk '{print $2}' | xargs kill -9
fi

# 清除环境变量
if [[ $MODE = 'user' ]]; then

    echo -e "\n服务关闭成功，请执行以下命令关闭系统代理：source $(pwd)/proxy/proxy_off.sh\n"
else
    > /etc/profile.d/clash.sh

    echo -e "\n服务关闭成功，请执行以下命令关闭系统代理：proxy_off\n"
fi